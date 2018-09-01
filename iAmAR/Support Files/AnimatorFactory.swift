//
//  AnimatorFactory.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/31/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

class AnimatorFactory {
    func jiggle(_ view: UIView)
    {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.25) {
                                                        view.transform = CGAffineTransform(rotationAngle: -.pi/8)
                                    }
                                    UIView.addKeyframe(withRelativeStartTime: 0.33,
                                                       relativeDuration: 0.25) {
                                                        view.transform = CGAffineTransform(rotationAngle: +.pi/8)
                                    }
                                    UIView.addKeyframe(withRelativeStartTime: 0.67,
                                                       relativeDuration: 0.25) {
                                                        view.transform = CGAffineTransform.identity
                                    }
        },
                                completion: nil
        )
    }
    
    func flipLeftToRight(_ label: UILabel, i: Int)
    {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        let secondLabel = label
        switch i
        {
        case 0:
            secondLabel.text = "About Me!"
        case 1:
            secondLabel.text = "My Experience!"
        case 2:
            secondLabel.text = "My Portfolio!"
        default:
            fatalError("unidentified case")
        }
        label.superview?.addSubview(secondLabel)
        secondLabel.isHidden = true
        UIView.transition(with: label, duration: 0.5, options: transitionOptions, animations: {
            label.isHidden = true
        }, completion: nil)
        
        UIView.transition(with: label, duration: 0.5, options: transitionOptions, animations: {
            secondLabel.isHidden = false
        }, completion: nil)
    }
    
    
}
