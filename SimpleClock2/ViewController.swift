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
    
    var dataPicker = UIDatePicker()
    
    var timer = Timer()
    
    
    
    
    var second = 30
    var minute = 20
    var hour = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sipleclock2.translatesAutoresizingMaskIntoConstraints = false
        
        sipleclock2.center = view.center
        sipleclock2.layer.borderWidth = 2
        sipleclock2.layer.borderColor = UIColor.black.cgColor
        
        sipleclock2.layer.cornerRadius = sipleclock2.frame.height / 2
        
        
       
        dataPicker.frame = CGRect(x: 0, y: 40, width: 200, height: 50)
        dataPicker.center.x = sipleclock2.center.x
        dataPicker.center.y = sipleclock2.center.y
        
        dataPicker.preferredDatePickerStyle = .compact
        dataPicker.datePickerMode = .time
        view.addSubview(dataPicker)
        
        dataPicker.addTarget(self, action: #selector(dataPickerAction(sender:)), for: .valueChanged)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
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
        movementHandClock(count: 12, index: 1, handView: hourClock)
        movementHandClock(count: 60, index: 20, handView: minuteHandClock)
        movementHandClock(count: 60, index: 30, handView: secondHandClock)
            
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
        let date = dataPicker.date
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
            movementHandClock(count: 60, index: minute, handView: minuteHandClock)
            if minute == 60 {
                minute = 0
                movementHandClock(count: 12, index: hour, handView: hourClock)
            }
            
        }
        
    }
        
    
}

