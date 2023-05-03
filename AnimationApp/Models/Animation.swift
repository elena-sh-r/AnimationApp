//
//  Animation.swift
//  AnimationApp
//
//  Created by Elena Sharipova on 03.05.2023.
//

import CoreGraphics
import SpringAnimation

struct Animation {
    let preset: AnimationPreset
    let curve: AnimationCurve
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    static func getAnimation() -> Animation {
        let animation = Animation(
            preset: AnimationPreset.allCases.randomElement() ?? AnimationPreset.pop,
            curve: AnimationCurve.allCases.randomElement() ?? AnimationCurve.easeIn,
            force: CGFloat.random(in: 1...5),
            duration: CGFloat.random(in: 0.5...5),
            delay: CGFloat.random(in: 0...5)
        )
        
        return animation
    }
}
