//
//  UIViewExtension.swift
//  Extensions
//
//  Created by Nicki Minaj Fanboy #1 on 13.03.19.
//

import Foundation
import UIKit

extension UIView {
    func blurView()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 3.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    func fadeViewInThenOut(delay: TimeInterval, animationDuration: TimeInterval) {
        
        // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.alpha = 1
        }) { (Bool) -> Void in
            // After the animation completes, fade out the view after a delay
            UIView.animate(withDuration: animationDuration, delay: delay, options: [], animations: { () -> Void in
                self.alpha = 0
            }, completion: nil)
        }
    }
}
