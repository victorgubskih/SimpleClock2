//
//  ViewController.swift
//  SimpleClock2
//
//  Created by viktor on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var simpleClock: ClockView!
    
    var centreCirckle: UIView!
   
    
    weak var hourClock: UIView!
    
    weak var minuteHandClock: UIView!
    
   
    weak var secondHandClock: UIView!
    
   
    
    var timer = Timer()
    
    
    
    
    var second = 60
    var minute = 60
    var hour = 12
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        simpleClock = ClockView()
        simpleClock.frame.size = CGSize(width: 270, height: 270)
        simpleClock.layer.cornerRadius = simpleClock.frame.height / 2
        simpleClock.center = view.center
        simpleClock.layer.borderWidth = 2
        simpleClock.layer.borderColor = UIColor.black.cgColor
        simpleClock.backgroundColor = UIColor.lightGray
        view.addSubview(simpleClock)
        
        let hourClock = UIView()
        hourClock.frame.size = CGSize(width: 16, height: 70)
        hourClock.layer.borderWidth = 1
        hourClock.layer.borderColor = UIColor.black.cgColor
        hourClock.layer.cornerRadius = 10
        hourClock.backgroundColor = UIColor.black
        hourClock.center = CGPoint(x: simpleClock.frame.width/2, y: simpleClock.frame.height/2 - hourClock.frame.height / 2)
        simpleClock.addSubview(hourClock)
        self.hourClock = hourClock
       
        let minuteHandClock = UIView()
        minuteHandClock.frame.size = CGSize(width: 8, height: 90)
        minuteHandClock.layer.borderWidth = 1
        minuteHandClock.layer.borderColor = UIColor.green.cgColor
        minuteHandClock.layer.cornerRadius = 10
        minuteHandClock.backgroundColor = UIColor.green
        minuteHandClock.center = CGPoint(x: simpleClock.frame.width/2, y: simpleClock.frame.height/2 - minuteHandClock.frame.height / 2)
        simpleClock.addSubview(minuteHandClock)
        self.minuteHandClock = minuteHandClock
        
        let secondHandClock = UIView()
        secondHandClock.frame.size = CGSize(width: 4, height: 95)
        secondHandClock.layer.borderWidth = 1
        secondHandClock.layer.borderColor = UIColor.red.cgColor
        secondHandClock.layer.cornerRadius = 10
        secondHandClock.backgroundColor = UIColor.red
        secondHandClock.center = CGPoint(x: simpleClock.frame.width/2, y: simpleClock.bounds.height/2 - secondHandClock.frame.height / 2)
        simpleClock.addSubview(secondHandClock)
        self.secondHandClock = secondHandClock
        
        let centreCircle = ClockView()
        centreCircle.frame.size = CGSize(width: 20, height: 20)
        centreCircle.layer.cornerRadius = centreCircle.frame.height / 2
        centreCircle.center = view.center
        centreCircle.layer.borderWidth = 1
        centreCircle.layer.borderColor = UIColor.black.cgColor
        centreCircle.backgroundColor = UIColor.orange
        view.addSubview(centreCircle)
       
       
       
        
        
        
        movementHandClock(count: 12, index: 0, handView: hourClock)
        movementHandClock(count: 60, index: 0, handView: minuteHandClock)
        movementHandClock(count: 60, index: 0, handView: secondHandClock)
        
        
       
        
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        
        
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

