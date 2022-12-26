//
//  ViewController.swift
//  SimpleClock2
//
//  Created by viktor on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var simpleClock: ClockView!
    
    
   
    
    weak var hourClock: UIView!
    
    weak var minuteHandClock: UIView!
    
   
    weak var secondHandClock: UIView!
    
   
    
    var timer = Timer()
    
    
    
    
    var second = 30
    var minute = 20
    var hour = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        simpleClock = ClockView()
        simpleClock.frame.size = CGSize(width: 270, height: 270)
        simpleClock.layer.cornerRadius = simpleClock.frame.height / 2
        simpleClock.center = view.center
        simpleClock.layer.borderWidth = 2
        simpleClock.layer.borderColor = UIColor.black.cgColor
        view.addSubview(simpleClock)
        
        let hourClock = UIView()
        hourClock.frame.size = CGSize(width: 16, height: 70)
        hourClock.layer.borderWidth = 1
        hourClock.layer.borderColor = UIColor.black.cgColor
        hourClock.center = CGPoint(x: simpleClock.frame.width/2, y: simpleClock.frame.height/2 - hourClock.frame.height / 2)
        simpleClock.addSubview(hourClock)
        self.hourClock = hourClock
       
        let minuteHandClock = UIView()
        minuteHandClock.frame.size = CGSize(width: 8, height: 90)
        minuteHandClock.layer.borderWidth = 1
        minuteHandClock.layer.borderColor = UIColor.green.cgColor
        minuteHandClock.center = CGPoint(x: simpleClock.frame.width/2, y: simpleClock.frame.height/2 - minuteHandClock.frame.height / 2)
        simpleClock.addSubview(minuteHandClock)
        self.minuteHandClock = minuteHandClock
        
        let secondHandClock = UIView()
        secondHandClock.frame.size = CGSize(width: 4, height: 95)
        secondHandClock.layer.borderWidth = 1
        secondHandClock.layer.borderColor = UIColor.red.cgColor
        secondHandClock.center = CGPoint(x: simpleClock.frame.width/2, y: simpleClock.bounds.height/2 - secondHandClock.frame.height / 2)
        simpleClock.addSubview(secondHandClock)
        self.secondHandClock = secondHandClock
       
        movementHandClock(count: 12, index: 0, handView: hourClock)
        movementHandClock(count: 60, index: 0, handView: minuteHandClock)
        movementHandClock(count: 60, index: 0, handView: secondHandClock)
        
        
       
        
       // timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        
        
        simpleClock.createOblectAraundCircle()
    }

    func createOblectAraundCircle() {
        
        let centre = CGPoint(x: simpleClock.bounds.width / 2, y: simpleClock.bounds.height / 2)
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
            
            simpleClock.addSubview(label)
            angle += step
            
        }
    
    
   
    
            
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
    @objc func dataPickerAction(sender: UIDatePicker) {
        let date = sender.date
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0
        movementHandClock(count: 12, index: hour, handView: hourClock)
        movementHandClock(count: 60, index: minute, handView: minuteHandClock)
        movementHandClock(count: 60, index: second, handView: secondHandClock)
            
    }
    @objc func timerAction() {
        second += 1
        movementHandClock(count: 60, index: second, handView: secondHandClock)
        if second == 60  {
            second = 0
            minute += 1
            movementHandClock(count: 60, index: minute, handView: minuteHandClock)
            if minute == 60 {
                minute = 0
                hour += 1
                movementHandClock(count: 12, index: hour, handView: hourClock)
            }
            
        }
        
    }
        
    
}

