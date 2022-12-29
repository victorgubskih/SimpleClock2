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
        simpleClock.setTime(second: 0, minute: 0, hour: 0)
        simpleClock.createCentreCircle()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }

    @objc func timerAction() {
        simpleClock.second += 1
        
        if simpleClock.second  == 60  {
            simpleClock.second  = 0
            simpleClock.minute += 1
           
            if simpleClock.minute  == 60 {
                simpleClock.minute  = 0
                simpleClock.hour += 1
               
            }
        }
        simpleClock.setTime(second: simpleClock.second, minute: simpleClock.minute, hour: simpleClock.hour)
    }
    
   
}

