//
//  ViewController.swift
//  DrawViews
//
//  Created by VyacheslavKrivoi on 4/14/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flag:Bool=true
    var viewCollection: Array<UIView> = [SubView1(frame: CGRect(x: 30, y: 50, width: 98, height: 150)), SubView2(frame: CGRect(x:158, y: 50, width: 98, height: 150)), SubView3(frame: CGRect(x:286, y: 50, width: 98, height: 150)), SubView4(frame: CGRect(x:30, y: 220, width: 98, height: 150)), SubView5(frame: CGRect(x:158, y: 220, width: 98, height: 150)), SubView6(frame: CGRect(x:286, y: 220, width: 98, height: 150))]
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
        for i in 0...viewCollection.count-1{
            self.view.addSubview(viewCollection[i])
        
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
          let choiceView = tap.view
                choiceView?.frame = CGRect(x:60, y: 90, width: 294, height: 586)
                choiceView?.isHidden = false
        
        let imageView = UIImageView(image: UIImage(named: "cardBack"))
        if flag == false   {
            choiceView?.addSubview(imageView)
            flag=true
        }else{
            choiceView?.subviews.last?.isHidden = true
            flag = false
        }
    }
}

