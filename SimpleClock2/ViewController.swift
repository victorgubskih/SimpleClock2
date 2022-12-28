//
//  ViewController.swift
//  SimpleClock2
//
//  Created by viktor on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var simpleClock: ClockView!
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
        
        simpleClock.createOblectAraundCircle()
        
        simpleClock.createArrrowsAndClock()
        simpleClock.movementHandClock(count: 12, index: 0, handView: simpleClock.hourArrow)
        simpleClock.movementHandClock(count: 60, index: 0, handView: simpleClock.minuteArrow)
        simpleClock.movementHandClock(count: 60, index: 0, handView: simpleClock.secondArrow)
        
        let centreCircle = UIView()
        centreCircle.frame.size = CGSize(width: 20, height: 20)
        centreCircle.layer.cornerRadius = centreCircle.frame.height / 2
        centreCircle.center = view.center
        centreCircle.layer.borderWidth = 1
        centreCircle.layer.borderColor = UIColor.black.cgColor
        centreCircle.backgroundColor = UIColor.orange
        view.addSubview(centreCircle)
       
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }

    @objc func dataPickerAction(sender: UIDatePicker) {
        let date = sender.date
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0
        simpleClock.movementHandClock(count: 12, index: hour, handView: simpleClock.hourArrow)
        simpleClock.movementHandClock(count: 60, index: minute, handView: simpleClock.minuteArrow)
        simpleClock.movementHandClock(count: 60, index: second, handView: simpleClock.secondArrow)
    }
    
    @objc func timerAction() {
        second += 1
        simpleClock.movementHandClock(count: 60, index: second, handView: simpleClock.secondArrow)
        if second == 60  {
            second = 0
            minute += 1
            simpleClock.movementHandClock(count: 60, index: minute, handView: simpleClock.minuteArrow)
            if minute == 60 {
                minute = 0
                hour += 1
                simpleClock.movementHandClock(count: 12, index: hour, handView: simpleClock.hourArrow)
            }
            
        }
        
    }
        
    
}

