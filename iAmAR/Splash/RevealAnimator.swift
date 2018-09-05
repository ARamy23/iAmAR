//
//  RevealAnimator.swift
//  iAmAR
//
//  Created by ScaRiLiX on 9/5/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

class RevealAnimator: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {
    let animationDuration = 2.0
    var operation: UINavigationControllerOperation = .push
    weak var storedContext: UIViewControllerContextTransitioning?
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext:
        UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    func animateTransition(using transitionContext:
        UIViewControllerContextTransitioning) {
        
        
        storedContext = transitionContext
        
        let fromVC = transitionContext.viewController(forKey:
            .from) as! SplashVC
        let toVC = transitionContext.viewController(forKey:
            .to) as! MainVC
        transitionContext.containerView.addSubview(toVC.view)
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue =
            NSValue(caTransform3D: CATransform3DIdentity)
        animation.toValue =
            NSValue(caTransform3D:
                CATransform3DConcat(
                    CATransform3DMakeTranslation(20, 0, 0.0),
                    CATransform3DMakeScale(150, 150, 1.0)
        ))
        
        animation.duration = animationDuration
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseIn)
        
        
        let maskLayer: CALayer = fromVC.ARLabel.layer
        maskLayer.position = fromVC.ARLabel.layer.position
        toVC.view.layer.mask = maskLayer
        maskLayer.add(animation, forKey: nil)
        fromVC.ARLabel.layer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let context = storedContext {
            context.completeTransition(!context.transitionWasCancelled)
            let fromVC = context.viewController(forKey: .from)
                as! SplashVC
            fromVC.ARLabel.layer.removeAllAnimations()
            
            let toVC = context.viewController(forKey: .to)
                as! MainVC
            toVC.view.layer.mask = nil
        }
        storedContext = nil
        
    }
    
}
