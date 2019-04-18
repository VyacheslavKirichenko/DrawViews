//
//  UIView.swift
//  DrawViews
//
//  Created by VyacheslavKrivoi on 4/18/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit
extension UIView {
    
    func cardsMatchAnimation(completion: (() -> Swift.Void)? = nil)  {
        let animator = UIViewPropertyAnimator(
            duration: Constants.matchCardAnimationDuration,
            curve: .linear ,
            animations: {
                self.center = self.superview!.center
                self.transform = CGAffineTransform.identity.scaledBy(x: Constants.matchCardAnimationScaleUp,
                                                                     y: Constants.matchCardAnimationScaleUp)
        })
        animator.addCompletion({ position in
            completion?()
        })
        animator.startAnimation()
}
}
