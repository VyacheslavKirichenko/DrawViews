//
//  SubView1.swift
//  DrawViews
//
//  Created by VyacheslavKrivoi on 4/14/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class SubView1: UIView {

    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func drawCustomText(text: String,textSize: Int){
        let tex: NSString = text as NSString
        let fontSize = textSize
        let font = UIFont(name: "Helvetica Bold", size: CGFloat(fontSize))!
        let textRect = CGRect(x: self.bounds.maxX/2 - CGFloat(fontSize)/3.6, y: self.bounds.maxY/2 - CGFloat(fontSize)/3, width: CGFloat(fontSize), height: CGFloat(fontSize))
        let attributs: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.red
        ]
        tex.draw(in: textRect, withAttributes: attributs)
    }

    
    override func draw(_ rect: CGRect) {
        drawCustomText(text:"0", textSize: 40)
  
    }
}
