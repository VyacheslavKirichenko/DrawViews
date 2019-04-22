//
//  UIView.swift
//  DrawViews
//
//  Created by VyacheslavKrivoi on 4/18/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit
extension UIView {
    
    func viewAnimationToMax(completion: (() -> Swift.Void)? = nil)  {
        let animator = UIViewPropertyAnimator(
            duration: Constants.matchCardAnimationDuration,
            curve: .linear ,
            animations: {
                self.center = CGPoint(x: self.superview!.frame.maxX/6, y: self.superview!.frame.maxY/6)
                self.transform = CGAffineTransform.identity.scaledBy(x: Constants.matchCardAnimationScaleUp,
                                                                     y: Constants.matchCardAnimationScaleUp)
                self.frame = CGRect(x:0, y: 0, width: 414, height: 896)
        })
        animator.addCompletion({ position in
            completion?()
        })
        animator.startAnimation()
}
    
    
    func viewAnimationToMin(completion: (() -> Swift.Void)? = nil)  {
        let animator = UIViewPropertyAnimator(
            duration: Constants.matchCardAnimationDuration,
            curve: .linear ,
            animations: {
                self.center = CGPoint(x: self.superview!.frame.maxX/6, y: self.superview!.frame.maxY/6)
                self.transform = CGAffineTransform.identity.scaledBy(x:Constants.matchCardAnimationScaleDown,
                                                        y: Constants.matchCardAnimationScaleDown)
                self.frame = CGRect(x:self.bounds.maxX/2, y: self.bounds.maxY, width: 147, height: 225)
        })
        animator.addCompletion({ position in
            completion?()
        })
        animator.startAnimation()
    }
}
