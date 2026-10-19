#!/usr/bin/env python3
"""Summarise deep probe JSON and slider images from a downloaded capture run."""
import json, math, sys
from pathlib import Path
from collections import deque
from PIL import Image

def val(d, key, default=None):
    x=d.get(key, default)
    return x.get('value', default) if isinstance(x,dict) and 'value' in x else x
def fmt(x):
    if x is None: return '—'
    if isinstance(x,float): return f'{x:.3f}'
    return str(x)
def rectstr(r):
    return '—' if not isinstance(r,dict) else f"({fmt(r.get('x'))},{fmt(r.get('y'))} {fmt(r.get('width'))}×{fmt(r.get('height'))})"
def color_at(im,x,y): return im.convert('RGBA').getpixel((x,y))
def components(mask,w,h):
    seen=bytearray(w*h); out=[]
    for i,on in enumerate(mask):
        if not on or seen[i]: continue
        q=[i]; seen[i]=1; xs=[]; ys=[]
        while q:
            j=q.pop(); x=j%w; y=j//w; xs.append(x); ys.append(y)
            for ni in (j-1,j+1,j-w,j+w):
                if ni<0 or ni>=w*h or seen[ni] or not mask[ni]: continue
                nx=ni%w; ny=ni//w
                if abs(nx-x)+abs(ny-y)!=1: continue
                seen[ni]=1; q.append(ni)
        if len(xs)>=2: out.append((min(xs),min(ys),max(xs)+1,max(ys)+1))
    return sorted(out,key=lambda r:(r[1],r[0]))
def in_rect(px,py,r,sx,sy,scale):
    if not isinstance(r,dict): return False
    # Convert AppKit screen rect (origin bottom-left) to crop pixel coordinates (top-left).
    x=(r['x']-sx)*scale; y=(sy+r.get('_screenHeight',0)-(r['y']+r['height']))*scale
    return x<=px<x+r['width']*scale and y<=py<y+r['height']*scale
def clusters(path,kind,meta,d):
    try: im=Image.open(path).convert('RGBA')
    except Exception as e: return f'image unavailable ({e})'
    w,h=im.size; pix=list(im.getdata()); mask=[]
    if kind=='shot':
        bg=color_at(im,2,2); sr=meta.get('screenRect',{}); frame=val(d,meta['id']+'.frameScreen',{}) or {}
        scale=meta.get('pixelScale',1); sh=sr.get('height',h/scale); sx=sr.get('x',0); sy=sr.get('y',0)
        for i,p in enumerate(pix):
            x=i%w;y=i//w
            # Map slider bar and knob screen rects into screenshot pixels.
            excluded=False
            for k in ('barRectScreen','knobRectScreen'):
                r=val(d,meta['id']+'.'+k,{}) or {}
                rx=(r.get('x',0)-sx)*scale; ry=(sy+sh-(r.get('y',0)+r.get('height',0)))*scale
                if rx<=x<rx+r.get('width',0)*scale and ry<=y<ry+r.get('height',0)*scale: excluded=True
            mask.append(not excluded and any(abs(p[c]-bg[c])>8 for c in range(3)))
        rects=components(mask,w,h); rows=[]
        for x0,y0,x1,y1 in rects:
            cx=(x0+x1-1)//2; cy=(y0+y1-1)//2
            # Local points relative to slider frame, y down. Screenshot crop is top-down.
            lx=(sx+x0/scale-frame.get('x',sx)); ly=(frame.get('y',sy)+frame.get('height',0) - (sy+sh-y0/scale))
            rows.append(f"{(lx,ly,(x1-x0)/scale,(y1-y0)/scale)} RGB={pix[cy*w+cx][:3]}")
    else:
        for p in pix: mask.append(p[3]>0)
        rects=components(mask,w,h); rows=[]
        for x0,y0,x1,y1 in rects:
            cx=(x0+x1-1)//2; cy=(y0+y1-1)//2
            rows.append(f"{(x0/2,y0/2,(x1-x0)/2,(y1-y0)/2)} RGBA={pix[cy*w+cx]}")
    return '; '.join(rows) if rows else 'none'
def visual_bar_position(path,meta,d,orientation):
    """Find screenshot pixel runs that differ from the crop background across the unfilled bar."""
    try: im=Image.open(path).convert('RGBA')
    except Exception as e: return f'image unavailable ({e})'
    w,h=im.size; pix=im.load(); bg=pix[2,2]
    sr=meta.get('screenRect',{}); frame=val(d,meta['id']+'.frameScreen',{}) or {}
    bar=val(d,meta['id']+'.barRectScreen',{}) or {}
    scale=meta.get('pixelScale',1); sh=sr.get('height',h/scale); sx=sr.get('x',0); sy=sr.get('y',0)
    bx=(bar.get('x',0)-sx)*scale; by=(sy+sh-(bar.get('y',0)+bar.get('height',0)))*scale
    bw=bar.get('width',0)*scale; bh=bar.get('height',0)*scale
    if orientation=='horizontal':
        sample_x=round(bx+bw-30*scale); indices=range(max(0,round(by)),min(h,round(by+bh)))
        points=[(sample_x,i) for i in indices]; local=lambda i: frame.get('y',sy)+frame.get('height',0)-(sy+sh-i/scale)
        axis='rows'
    else:
        sample_y=round(by+30*scale); indices=range(max(0,round(bx)),min(w,round(bx+bw)))
        points=[(i,sample_y) for i in indices]; local=lambda i: sx+i/scale-frame.get('x',sx)
        axis='columns'
    active=[]
    for i,(x,y) in zip(indices,points):
        if 0<=x<w and 0<=y<h and any(abs(pix[x,y][c]-bg[c])>8 for c in range(3)): active.append(i)
    runs=[]
    if active:
        start=prev=active[0]
        for i in active[1:]:
            if i!=prev+1: runs.append((start,prev+1)); start=i
            prev=i
        runs.append((start,prev+1))
    ranges=', '.join(f'{local(a):.2f}–{local(b):.2f}' for a,b in runs)
    return f'{axis}={ranges or "none"} pt'
def luminance(path):
    im=Image.open(path).convert('RGB'); px=list(im.getdata())
    return sum(.2126*r+.7152*g+.0722*b for r,g,b in px)/len(px)
def flatten_views(v, out):
    if not isinstance(v,dict): return
    out.append(v)
    for c in v.get('subviews',[]): flatten_views(c,out)
def first_class(items,name): return next((x for x in items if name in x.get('class','')),None)
def timeline(data,key):
    samples=val(data,key,[]) or []; prev=None; rows=[]
    for s in samples:
        wins=s.get('windows',[]); w=wins[0] if wins else {}
        serv=s.get('server',[]); server=serv[0].get('alpha') if serv else None
        vals=(w.get('alphaValue'),w.get('rootOpacity'),w.get('rootTransform'),server)
        if wins and (prev is None or vals!=prev): rows.append((s.get('t'),*vals))
        if wins: prev=vals
    return rows
def main(run):
    root=Path(run); parts=[]
    for passname in ('light','dark'):
        candidates=list(root.glob(f'**/probes/{passname}/deep.json'))
        if not candidates: parts.append(f'## {passname}\n\nNo deep.json found.'); continue
        jp=candidates[0]; d=json.loads(jp.read_text(encoding='utf-8')); folder=jp.parent/'deep'
        parts.append(f'## {passname}\n')
        parts.append(f"### Window\n\n`deep.window`: `{json.dumps(val(d,'deep.window'),separators=(',',':'))}`\n")
        image_rows=[]
        images=sorted(set(folder.glob('slider*.png')) | set(folder.glob('sliderDrag*.png')))
        for f in images:
            if '@2x-cache' in f.name: continue
            try:
                m=luminance(f); image_rows.append(f"{f.name}={m:.2f}"+(' BLACK' if m<10 else ''))
            except Exception as e: image_rows.append(f'{f.name}=unreadable({e})')
        parts.append('Images (mean luminance; BLACK < 10): '+'; '.join(image_rows))
        parts.append('\n### Tick marks\n')
        for size in ('mini','small','regular','large','extraLarge'):
            for pos in ('below','above'):
                ident=f'slider.{size}.ticks.{pos}'; shot=val(d,ident+'.screenshot'); cache=val(d,ident+'.cache2x')
                if not isinstance(shot,dict): continue
                bar=visual_bar_position(folder/shot.get('file',''),dict(shot,id=ident),d,'horizontal')
                parts.append(f"- `{ident}` 1×: {clusters(folder/shot.get('file',''), 'shot', dict(shot,id=ident), d)}; visual bar {bar}")
                if isinstance(cache,dict): parts.append(f"  2× cache: {clusters(folder/cache.get('file',''),'cache',cache,d)}")
        parts.append('\n### Vertical tick marks\n')
        for size in ('mini','small','regular','large'):
            for pos in ('leading','trailing'):
                ident=f'sliderV.{size}.{pos}'; shot=val(d,ident+'.screenshot'); cache=val(d,ident+'.cache2x')
                if not isinstance(shot,dict): continue
                bar=visual_bar_position(folder/shot.get('file',''),dict(shot,id=ident),d,'vertical')
                parts.append(f"- `{ident}` 1×: {clusters(folder/shot.get('file',''), 'shot', dict(shot,id=ident), d)}; visual bar {bar}")
                if isinstance(cache,dict): parts.append(f"  2× cache: {clusters(folder/cache.get('file',''),'cache',cache,d)}")
        parts.append('\n### Menus\n')
        menuids=['context']+[f'{kind}.{size}' for kind in ('popup','pulldown') for size in ('mini','small','regular','large','extraLarge')]
        for mid in menuids:
            p='openMenu.'+mid; bf=val(d,p+'.buttonFrameScreen'); windows=val(d,p+'.windows',[]) or []; mw=next((x for x in windows if 'frame' in x),{})
            views=[]; flatten_views(mw.get('views'),views)
            row=first_class(views,'NSTableRowView'); tf=first_class(views,'_NSMenuItemTextField')
            dx=(mw.get('frame',{}).get('x',0)-bf.get('x',0)) if isinstance(bf,dict) and mw else None
            gap=(bf.get('y',0)-(mw.get('frame',{}).get('y',0)+mw.get('frame',{}).get('height',0))) if isinstance(bf,dict) and mw else None
            parts.append(f"- `{mid}` button={rectstr(bf)} font={json.dumps(val(d,p+'.buttonFont'),separators=(',',':'))}; menu={rectstr(mw.get('frame'))} dx={fmt(dx)} gap={fmt(gap)}; rowH={fmt((row or {}).get('frame',{}).get('height'))}; textX={fmt((tf or {}).get('frame',{}).get('x'))} textFont={json.dumps((tf or {}).get('font'),separators=(',',':'))}; highlighted={val(d,p+'.highlightedItem')}")
        parts.append('\n### Menu timeline\n')
        for mid in menuids:
            p='openMenu.'+mid; descriptions=[]
            for typ in ('openTimeline','closeTimeline'):
                rows=timeline(d,p+'.'+typ)
                descriptions.append(typ+': '+('none' if not rows else ' | '.join(f"t={fmt(t)} α={fmt(a)} root={fmt(o)} tr={fmt(tr)} server={fmt(sa)}" for t,a,o,tr,sa in rows)))
            parts.append('- '+mid+'; '+'; '.join(descriptions))
        parts.append('\n### Slider drag\n')
        target_times=(0.1,0.2,0.3,0.4,0.5,0.75,1.05,1.2,1.5)
        def nearest_sample(samples, target):
            return min(samples, key=lambda x: abs((x.get('t') or 0)-target)) if samples else {}
        for end in ('maxEnd','minEnd'):
            p=f'sliderDrag.regular.{end}'; samples=val(d,p+'.timeline',[]) or []
            # identify layer paths that move most across samples
            per={}
            for s in samples:
                for layer in s.get('layers',[]): per.setdefault(layer.get('path'),[]).append(layer)
            scores=[]
            for path,ls in per.items():
                frames=[x.get('frame',{}) for x in ls]; transforms=[x.get('transform') for x in ls]
                score=sum(abs((frames[-1].get(k,0) or 0)-(frames[0].get(k,0) or 0)) for k in ('x','y','width','height'))+ (0 if transforms[0]==transforms[-1] else 1)
                if score: scores.append((score,path))
            paths=[x[1] for x in sorted(scores,reverse=True)[:6]]
            parts.append(f"- `{end}` tracking={val(d,p+'.tracking')} finalValue={fmt(val(d,p+'.finalValue'))}; changing paths={paths}")
            if samples:
                details=[]
                for target in target_times:
                    s=nearest_sample(samples,target)
                    cols=[f"t={target:.2f} (sample {fmt(s.get('t'))}) value={fmt(s.get('doubleValue'))}"]
                    for path in paths:
                        x=next((z for z in s.get('layers',[]) if z.get('path')==path),{})
                        if x: cols.append(f"{path}:f={rectstr(x.get('frame'))}")
                    if target in (0.5,0.75):
                        overlays=[]
                        for wi,overlay in enumerate(s.get('overlayWindows',[])):
                            layers=','.join(f"{x.get('path')}:{rectstr(x.get('frame'))}" for x in overlay.get('layers',[]))
                            overlays.append(f"window[{wi}]={rectstr(overlay.get('frame'))} layers=[{layers}]")
                        cols.append('overlays=['+('; '.join(overlays) if overlays else 'none')+']')
                    details.append('; '.join(cols))
                parts.append('  timeline: '+'<br>'.join(details))
    parts.append('\n## Renders (all probe passes)\n')
    for passname in ('light','dark','light-contrast','dark-contrast'):
        candidates=list(root.glob(f'**/probes/{passname}/deep.json'))
        if not candidates:
            parts.append(f'### {passname}\n\nNo deep.json found.\n'); continue
        jp=candidates[0]; d=json.loads(jp.read_text(encoding='utf-8')); folder=jp.parent/'deep'
        render_ids=sorted(k[:-len('.screenshot')] for k in d
                          if k.startswith('render.') and k.endswith('.screenshot'))
        transparent=[]; uniform=[]; regular_by_kind={}
        for ident in render_ids:
            shot=val(d,ident+'.screenshot',{}) or {}; cache=val(d,ident+'.cache2x',{}) or {}
            shot_path=folder/'render'/shot.get('file','')
            cache_path=folder/'render'/cache.get('file','')
            try:
                with Image.open(cache_path) as im:
                    if im.convert('RGBA').getchannel('A').getextrema()==(0,0): transparent.append(ident)
            except Exception as e:
                transparent.append(f'{ident} (unreadable 2x: {e})')
            try:
                with Image.open(shot_path) as im:
                    if len(set(im.convert('RGBA').getdata()))==1: uniform.append(ident)
            except Exception as e:
                uniform.append(f'{ident} (unreadable 1x: {e})')
            bits=ident.split('.')
            if len(bits)>=3 and bits[2]=='regular':
                kind=bits[1]; state='.'.join(bits[3:]) or 'default'
                try:
                    with Image.open(cache_path) as im: dims=f'{im.width}×{im.height}'
                except Exception: dims='unavailable'
                regular_by_kind.setdefault(kind,[]).append(f'{state}={dims}')
        parts.append(f'### {passname}: {len(render_ids)} render ids')
        parts.append(f'- Fully transparent 2×: {transparent}')
        parts.append(f'- Uniform 1×: {uniform}')
        for kind in sorted(regular_by_kind):
            parts.append(f'- Regular {kind}: '+', '.join(regular_by_kind[kind]))
    out='\n'.join(parts)+'\n'; lines=out.splitlines()
    if len(lines)>500: out='\n'.join(lines[:499]+['[truncated at 500 lines]'])+'\n'
    dest=root/'deep-summary.md'; dest.write_text(out,encoding='utf-8'); print(dest)
if __name__=='__main__':
    if len(sys.argv)!=2: raise SystemExit('usage: summarize-deep.py RUN_DIR')
    main(sys.argv[1])
