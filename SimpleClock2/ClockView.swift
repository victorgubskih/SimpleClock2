//
//  ClockView.swift
//  SimpleClock2
//
//  Created by viktor on 24.12.2022.
//

import UIKit

class ClockView: UIView {

    override var intrinsicContentSize: CGSize {
       return CGSize(width: 270, height: 270)
    }
    func createOblectAraundCircle() {
         
         let centre = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
         let radius: CGFloat = 100
         let count = 12
         
         var angle = CGFloat(2 * Double.pi - Double.pi / 3)
         let step = CGFloat( 2 * Double.pi) / CGFloat(count)
         
         for index in 0..<count {
             
             let x = cos(angle) * radius + centre.x
             let y = sin(angle) * radius + centre.y
             
             let label = UILabel()
             label.text = "\(index + 1)"
             
             label.font = UIFont(name: "Arial", size: 20)
             label.textColor = UIColor.black
             label.sizeToFit()
             
             label.center = CGPoint(x: x, y: y)
             
             self.addSubview(label)
             angle += step
             
         }
     
    }
}
