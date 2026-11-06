// Prints the stored values of SwiftUI's client-emitted Animation and Spring presets, so that MacUIKit
// can reproduce them (smooth, snappy, bouncy, spring, interactiveSpring and their parameterized
// forms, plus delay, speed and repeat modifiers). Output is the probe's own reflection dump.
import SwiftUI

func show(_ label: String, _ value: Any) {
    print("=== \(label)")
    dump(value)
}

func spring(_ label: String, _ s: Spring) {
    print("=== Spring.\(label): response=\(s.response) dampingRatio=\(s.dampingRatio) "
        + "duration=\(s.duration) bounce=\(s.bounce) mass=\(s.mass) stiffness=\(s.stiffness) "
        + "damping=\(s.damping) settlingDuration=\(s.settlingDuration)")
}

@main
struct Probe {
    static func main() {
        show("Animation.default", Animation.default)
        show("Animation.smooth", Animation.smooth)
        show("Animation.snappy", Animation.snappy)
        show("Animation.bouncy", Animation.bouncy)
        show("Animation.spring", Animation.spring)
        show("Animation.interactiveSpring", Animation.interactiveSpring)
        show("Animation.smooth(duration: 0.8, extraBounce: 0.1)", Animation.smooth(duration: 0.8, extraBounce: 0.1))
        show("Animation.snappy(duration: 0.8, extraBounce: 0.1)", Animation.snappy(duration: 0.8, extraBounce: 0.1))
        show("Animation.bouncy(duration: 0.8, extraBounce: 0.1)", Animation.bouncy(duration: 0.8, extraBounce: 0.1))
        show("Animation.spring(duration: 0.8, bounce: 0.3)", Animation.spring(duration: 0.8, bounce: 0.3))
        show("Animation.spring()", Animation.spring())
        show("Animation.interactiveSpring()", Animation.interactiveSpring())
        show("Animation.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.2)",
             Animation.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.2))
        show("Animation.default.delay(0.2)", Animation.default.delay(0.2))
        show("Animation.default.speed(2)", Animation.default.speed(2))
        show("Animation.easeInOut.repeatCount(3, autoreverses: true)", Animation.easeInOut.repeatCount(3, autoreverses: true))
        show("Animation.easeInOut.repeatForever()", Animation.easeInOut.repeatForever())
        spring("smooth", .smooth)
        spring("snappy", .snappy)
        spring("bouncy", .bouncy)
        spring("init()", Spring())
        spring("smooth(duration: 0.8, extraBounce: 0.1)", .smooth(duration: 0.8, extraBounce: 0.1))
        spring("snappy(duration: 0.8, extraBounce: 0.1)", .snappy(duration: 0.8, extraBounce: 0.1))
        spring("bouncy(duration: 0.8, extraBounce: 0.1)", .bouncy(duration: 0.8, extraBounce: 0.1))
        show("AnyTransition.asymmetric(insertion: .scale, removal: .opacity)",
             AnyTransition.asymmetric(insertion: .scale, removal: .opacity))
        show("AnyTransition.scale(scale: 0.5, anchor: .top)", AnyTransition.scale(scale: 0.5, anchor: .top))
        show("AnyTransition.opacity.combined(with: .slide)", AnyTransition.opacity.combined(with: .slide))
    }
}
