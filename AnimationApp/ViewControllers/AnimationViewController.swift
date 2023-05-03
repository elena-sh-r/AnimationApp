//
//  ViewController.swift
//  AnimationApp
//
//  Created by Elena Sharipova on 02.05.2023.
//

import UIKit
import SpringAnimation

final class AnimationViewController: UIViewController {
    
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var presetAnimationLabel: UILabel!
    @IBOutlet var curveAnimationLabel: UILabel!
    @IBOutlet var forceAnimationLabel: UILabel!
    @IBOutlet var durationAnimationLabel: UILabel!
    @IBOutlet var delayAnimationLabel: UILabel!
    
    private var currentAnimation = Animation.getAnimation()
    private var nextAnimation = Animation.getAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelTexts(from: currentAnimation)
    }

    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        setLabelTexts(from: currentAnimation)
        
        springAnimationView.animation = currentAnimation.preset.rawValue
        springAnimationView.curve = currentAnimation.curve.rawValue
        springAnimationView.force = currentAnimation.force
        springAnimationView.duration = currentAnimation.duration
        springAnimationView.delay = currentAnimation.delay
        springAnimationView.animate()
        
        sender.setTitle("Run \(nextAnimation.preset.rawValue)", for: .normal)
        
        currentAnimation = nextAnimation
        nextAnimation = Animation.getAnimation()
    }
    
    private func setLabelTexts(from animation: Animation) {
        presetAnimationLabel.text = "preset: \(String(currentAnimation.preset.rawValue))"
        curveAnimationLabel.text = "curve: \(String(currentAnimation.curve.rawValue))"
        forceAnimationLabel.text = "force: \(string(from: currentAnimation.force))"
        durationAnimationLabel.text = "duration: \(string(from: currentAnimation.duration))"
        delayAnimationLabel.text = "delay: \(string(from: currentAnimation.delay))"
    }
    
    private func string(from animationOption: CGFloat) -> String {
        String(format: "%.2f", animationOption)
    }
}

