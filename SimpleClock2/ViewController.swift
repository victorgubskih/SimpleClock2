//
//  ViewController.swift
//  SimpleClock2
//
//  Created by viktor on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sipleclock2: UIView!
    
    @IBOutlet weak var hourClock: UIView!
    
    @IBOutlet weak var minuteHandClock: UIView!
    
   
    @IBOutlet weak var secondHandClock: UIView!
    
    
    
    
    var second = 40
    var minute = 20
    var hour = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sipleclock2.translatesAutoresizingMaskIntoConstraints = false
        
        sipleclock2.center = view.center
        sipleclock2.layer.borderWidth = 2
        sipleclock2.layer.borderColor = UIColor.black.cgColor
        
        sipleclock2.layer.cornerRadius = sipleclock2.frame.height / 2
        
        createOblectAraundCircle()
    }

    func createOblectAraundCircle() {
        
        let centre = CGPoint(x: sipleclock2.bounds.width / 2, y: sipleclock2.bounds.height / 2)
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
            
            sipleclock2.addSubview(label)
            angle += step
            
        }
        movementHandClock(count: 12, index: hour, handView: hourClock)
        movementHandClock(count: 60, index: minute, handView: minuteHandClock)
        movementHandClock(count: 60, index: second, handView: secondHandClock)
            
    }
    func movementHandClock(count: Int, index: Int, handView: UIView) {
        let step = CGFloat(2 * Double.pi / CGFloat(count))
        
        let x = handView.bounds.width / 4
        let y = handView.bounds.height / 2
        var transform = CGAffineTransform(translationX: x, y: y)
        transform = transform.rotated(by: CGFloat(index) * step)
        transform = transform.translatedBy(x: -x, y: -y)
        handView.transform = transform
        
    }
        
    
}

