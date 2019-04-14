//
//  SubView4.swift
//  DrawViews
//
//  Created by VyacheslavKrivoi on 4/14/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class SubView4: UIView {

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
        let textRect = CGRect(x: self.bounds.maxX/2 - CGFloat(fontSize)/3.6, y: self.bounds.maxY/2 - CGFloat(fontSize)/2.6, width: CGFloat(fontSize), height: CGFloat(fontSize))
        let attributs: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.red
        ]
        tex.draw(in: textRect, withAttributes: attributs)
    }
    func createRectangle() {
        path = UIBezierPath()
        path.lineWidth = 5.0
        path.move(to: CGPoint(x: self.bounds.width/2, y: self.bounds.height/3))
        path.addLine(to: CGPoint(x: self.bounds.width/1.223, y: self.bounds.height/1.5))
        path.addLine(to: CGPoint(x: self.bounds.width/5.44 , y: self.bounds.height/1.5))
        path.close()
    }
    
    override func draw(_ rect: CGRect) {
        
        self.createRectangle()
        UIColor.red.setStroke()
        UIColor.green.setFill()
        path.fill()
        path.stroke()
        drawCustomText(text:"3", textSize: 40)
    }

}
