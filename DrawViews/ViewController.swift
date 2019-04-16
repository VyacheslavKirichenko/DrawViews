//
//  ViewController.swift
//  DrawViews
//
//  Created by VyacheslavKrivoi on 4/14/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var push: [UIPushBehavior]=[]
    var delegate: UIDynamicAnimatorDelegate!
    
    var flagIsFlip:Bool=true
    
    let imageView = UIImageView(image: UIImage(named: "cardBack"))
    
    var viewCollection: Array<UIView> = [SubView1(frame: CGRect(x:30, y: 50, width: 98, height: 150)), SubView2(frame: CGRect(x:158, y: 50, width: 98, height: 150)), SubView3(frame: CGRect(x:286, y: 50, width: 98, height: 150)), SubView4(frame: CGRect(x:30, y: 220, width: 98, height: 150)), SubView5(frame: CGRect(x:158, y: 220, width: 98, height: 150)), SubView6(frame: CGRect(x:286, y: 220, width: 98, height: 150))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...viewCollection.count-1{
            self.view.addSubview(viewCollection[i])
            let pb = UIPushBehavior(items: [viewCollection[i]], mode: .instantaneous)
            pb.angle = (2*CGFloat.pi).arc4random
            pb.magnitude = CGFloat(1.0)+CGFloat(2.0).arc4random
            push.append(pb)
            
        }
        ////
        let collisionBehavior = UICollisionBehavior(items: self.view.subviews)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        animator = UIDynamicAnimator (referenceView: view)
        gravity = UIGravityBehavior (items: self.view.subviews)
        gravity.gravityDirection = CGVector(dx: 0, dy: 0)
        animator.addBehavior (gravity)
        animator.addBehavior(collisionBehavior)
        
        for i in 0...push.count-1 {
            animator.addBehavior(push[i])
        }
        viewsClick()
    }
    private func viewsClick () {
        for i in 0..<viewCollection.count {
            viewCollection[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedHandler(tap:))))
        }
    }
    
    @objc func tappedHandler(tap: UITapGestureRecognizer) {
        for view in viewCollection {
            view.isHidden = true
        }
       
        tap.view!.isHidden = false
       // animator.delegate = self
       // func dynamicAnimatorDidPause(animator: UIDynamicAnimator)
          tap.view!.frame = CGRect(x:60, y: 90, width: 294, height: 586)
        
        if flagIsFlip != true   {
            if imageView.superview != tap.view {
                tap.view!.addSubview(imageView)
            }
            imageView.isHidden = false
            flagIsFlip=true
        }else{
            imageView.isHidden = true
            flagIsFlip = false
        }
    }
   
}

extension CGFloat {
    var arc4random: CGFloat {
        return self * (CGFloat(arc4random_uniform(UInt32.max))/CGFloat(UInt32.max))
    }
}
extension ViewController: UIDynamicAnimatorDelegate
{
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator)
    {

    
    }
}
