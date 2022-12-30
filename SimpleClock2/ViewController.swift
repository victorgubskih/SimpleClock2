//
//  ViewController.swift
//  SimpleClock2
//
//  Created by viktor on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var simpleClock: ClockView!
    var simpleClock1: ClockView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleClock = ClockView()
        simpleClock.frame.size = CGSize(width: 270, height: 270)
        simpleClock.center = CGPoint( x: simpleClock.frame.width/2, y: simpleClock.frame.height/2 ) 
        view.addSubview(simpleClock)
        
        simpleClock.setUp()
        simpleClock.startTimer()
        
        simpleClock1 = ClockView()
        simpleClock1.frame.size = CGSize(width: 270, height: 270)
        simpleClock1.center = CGPoint( x: simpleClock1.frame.width/2 , y: simpleClock1.frame.height/2 + 300 )
        view.addSubview(simpleClock1)
        
        simpleClock1.setUp()
        simpleClock1.startTimer()
        
    }
}

