on run argv
	set processName to "UserNotificationCenter"
	set sawProcess to false
	set sawWindow to false
	repeat 25 times
		try
			tell application "System Events"
				set matchingProcesses to every application process whose name is processName
				if (count of matchingProcesses) > 0 then
					set sawProcess to true
					set targetProcess to item 1 of matchingProcesses
					set processLabel to name of targetProcess
					set processWindows to windows of targetProcess
					repeat with targetWindow in processWindows
						set sawWindow to true
						set windowLabel to "<unnamed>"
						try
							set windowLabel to name of targetWindow as text
						end try
						set staticLabels to {}
						set buttonLabels to {}
						set allElements to entire contents of targetWindow
						repeat with elementRef in allElements
							try
								if role of elementRef is "AXStaticText" then
									set end of staticLabels to (value of elementRef as text)
								end if
							end try
							try
								if role of elementRef is "AXButton" then
									set end of buttonLabels to (name of elementRef as text)
								end if
							end try
						end repeat
						set AppleScript's text item delimiters to " | "
						set staticText to staticLabels as text
						set buttonText to buttonLabels as text
						set AppleScript's text item delimiters to ""
						set normalizedText to staticText as text
						set isWallpaperPrompt to false
						ignoring case
							if normalizedText contains "WallpaperEdges" then
								if ((normalizedText contains "screen" and normalizedText contains "audio" and normalizedText contains "capture") or normalizedText contains "screen picker") then set isWallpaperPrompt to true
							end if
						end ignoring
						log "WINDOW process=" & processLabel & " label=" & windowLabel & " staticTexts=" & staticText & " buttons=" & buttonText
						if isWallpaperPrompt then
							repeat with targetButton in allElements
								set buttonLabel to ""
								try
									if role of targetButton is "AXButton" then set buttonLabel to name of targetButton as text
								end try
								if buttonLabel is "Allow" then
									try
										click targetButton
										log "CLICK process=" & processLabel & " window=" & windowLabel & " button=" & buttonLabel & " result=action-succeeded"
										delay 2
										set stillPresent to false
										try
											set stillPresent to exists targetWindow
										end try
										if stillPresent then
											log "READBACK result=window-still-present; acceptance-unconfirmed"
											return "CONSENT_CLICKED_READBACK_UNCONFIRMED"
										else
											log "READBACK result=matching-window-closed"
											return "CONSENT_CLICKED_READBACK_CONFIRMED"
										end if
									on error clickMessage number clickNumber
										log "CLICK process=" & processLabel & " window=" & windowLabel & " button=" & buttonLabel & " result=failure number=" & clickNumber & " message=" & clickMessage
										return "CLICK_FAILED"
									end try
								end if
							end repeat
						log "MATCHING_WINDOW result=no-button-named-exactly-Allow"
						return "MATCHING_PROMPT_NO_EXACT_ALLOW_BUTTON"
						end if
					end repeat
				end if
			end tell
			delay 1
		on error errMessage number errNumber
			if errNumber is -1743 or errNumber is -25211 then
				log "ACCESSIBILITY_ERROR number=" & errNumber & " message=" & errMessage
				return "ACCESSIBILITY_ERROR number=" & errNumber & " message=" & errMessage
			end if
			log "SYSTEM_EVENTS_ERROR number=" & errNumber & " message=" & errMessage
		end try
	end repeat
	if not sawProcess then log "PROCESS result=UserNotificationCenter-not-found"
	if sawProcess and not sawWindow then log "WINDOW result=no-windows-found"
	if sawWindow then log "CONSENT result=no-qualifying-WallpaperEdges-capture-prompt-found"
	return "NO_QUALIFYING_PROMPT_FOUND"
end run
