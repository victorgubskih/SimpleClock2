//
//  ClockView.swift
//  SimpleClock2
//
//  Created by viktor on 24.12.2022.
//

import UIKit

class ClockView: UIView {
    weak var hourArrow: UIView!
    weak var minuteArrow: UIView!
    weak var secondArrow: UIView!

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
    func createArrrowsAndClock() {
        let hourArrow = UIView()
        hourArrow.frame.size = CGSize(width: 16, height: 70)
        hourArrow.layer.borderWidth = 1
        hourArrow.layer.borderColor = UIColor.black.cgColor
        hourArrow.layer.cornerRadius = 10
        hourArrow.backgroundColor = UIColor.black
        hourArrow.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2 - hourArrow.frame.height / 2)
        self.addSubview(hourArrow)
        self.hourArrow = hourArrow
       
        let minuteArrow = UIView()
        minuteArrow.frame.size = CGSize(width: 8, height: 90)
        minuteArrow.layer.borderWidth = 1
        minuteArrow.layer.borderColor = UIColor.green.cgColor
        minuteArrow.layer.cornerRadius = 10
        minuteArrow.backgroundColor = UIColor.green
        minuteArrow.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2 - minuteArrow.frame.height / 2)
        self.addSubview(minuteArrow)
        self.minuteArrow = minuteArrow
        
        let secondArrow = UIView()
        secondArrow.frame.size = CGSize(width: 4, height: 95)
        secondArrow.layer.borderWidth = 1
        secondArrow.layer.borderColor = UIColor.red.cgColor
        secondArrow.layer.cornerRadius = 10
        secondArrow.backgroundColor = UIColor.red
        secondArrow.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2 - secondArrow.frame.height / 2)
        self.addSubview(secondArrow)
        self.secondArrow = secondArrow
        
    }
}
