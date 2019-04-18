//
//  ViewController.swift
//  DrawViews
//
//  Created by VyacheslavKrivoi on 4/14/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

struct Constants {
    static var flipCardAnimationDuration: TimeInterval = 0.9
    static var matchCardAnimationDuration: TimeInterval = 0.9
    static var matchCardAnimationScaleUp: CGFloat = 1.5
    static var matchCardAnimationScaleDown: CGFloat = 0.8
    static var behaviorResistance: CGFloat = 0
    static var behaviorElasticity: CGFloat = 1.0
    static var behaviorPushMagnitudeMinimum: CGFloat = 0.5
    static var behaviorPushMagnitudeRandomFactor: CGFloat = 1.0
    static var cardsPerMainViewWidth: CGFloat = 1
}

class ViewController: UIViewController {

    var pushBehaviors: [UIPushBehavior]=[]
    var flagIsFlip:Bool=false
    let imageView = UIImageView(image: UIImage(named: "cardBack"))
    
    private lazy var animator = UIDynamicAnimator(referenceView: view)
    private lazy var cardBehavior = CardBehavior(in: animator)
    
    
    
    var viewCollection: Array<UIView> = [SubView1(frame: CGRect(x:30, y: 50, width: 98, height: 150)), SubView2(frame: CGRect(x:158, y: 50, width: 98, height: 150)), SubView3(frame: CGRect(x:286, y: 50, width: 98, height: 150)), SubView4(frame: CGRect(x:30, y: 220, width: 98, height: 150)), SubView5(frame: CGRect(x:158, y: 220, width: 98, height: 150)), SubView6(frame: CGRect(x:286, y: 220, width: 98, height: 150))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...viewCollection.count-1{
            self.view.addSubview(viewCollection[i])
        }
        for cardView in viewCollection {
            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))
            cardBehavior.addItem(cardView)
        }
        
    }
  
    private var matchedCardViews: Set<UIView> = []
    private var lastChoosenCardview: UIView?
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
       
        if let chosenCardView = sender.view  {
          
//            for i in self.viewCollection {
//                i.isHidden = true                 ----->1
//            }
            sender.view?.isHidden = false
          
            cardBehavior.removeItem(chosenCardView)
            lastChoosenCardview=chosenCardView
            
            if flagIsFlip != true   {
                chosenCardView.frame = CGRect(x:60, y: 90, width: 98, height: 150)
                chosenCardView.cardsMatchAnimation(completion: nil)
                if imageView.superview != sender.view {
                    sender.view!.addSubview(imageView)
                }
                imageView.isHidden = false
                flagIsFlip=true
                
            }else{
//                for i in self.viewCollection {
//                    i.isHidden = false                ----->1
//                }
                imageView.isHidden = true
                flagIsFlip = false
                cardBehavior.addItem(sender.view!)
            }
        }
        
    }
   
}

