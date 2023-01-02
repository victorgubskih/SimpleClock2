//
//  ClockView.swift
//  SimpleClock2
//
//  Created by viktor on 24.12.2022.
//

import UIKit

class ClockView: UIView {
    var speed = 1.0
    
    var second = 0 {
        didSet {
            if second  == 60  {
                second  = 0
                minute += 1
            }
        }
    }
        var minute = 0 {
            didSet {
                if minute  == 60 {
                    minute  = 0
                    hour += 1
                }
            }
        }
    
    var hour = 0
    
    private weak var hourArrow: UIView!
    private weak var minuteArrow: UIView!
    private weak var secondArrow: UIView!
    var timer = Timer()
    
    
    init(speed: Double = 1) {
        super.init(frame: .zero)
        self.speed = speed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   // override var intrinsicContentSize: CGSize {
     //  return CGSize(width: 270, height: 270)
   // }
    
    func createCentreCircle() {
        let centreCircle = UIView()
        centreCircle.frame.size = CGSize(width: 20 * scale(), height: 20 * scale())
        centreCircle.layer.cornerRadius = centreCircle.frame.height / 2
        centreCircle.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        centreCircle.layer.borderWidth = 1
        centreCircle.layer.borderColor = UIColor.black.cgColor
        centreCircle.backgroundColor = UIColor.orange
        self.addSubview(centreCircle)
    }
    
    func createOblectAraundCircle() {
        self.layer.cornerRadius = frame.height / 2
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = UIColor.lightGray
       
        
        let centre = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let radius: CGFloat = 100 * scale()
        let count = 12
         
         var angle = CGFloat(2 * Double.pi - Double.pi / 3)
         let step = CGFloat( 2 * Double.pi) / CGFloat(count)
         
         for index in 0..<count {
             
             let x = cos(angle) * radius  + centre.x
             let y = sin(angle) * radius + centre.y
             
             let label = UILabel()
             label.text = "\(index + 1)"
             
             label.font = UIFont(name: "Arial", size: 20 * scale())
             label.textColor = UIColor.black
             label.sizeToFit()
             
             label.center = CGPoint(x: x, y: y)
             
             self.addSubview(label)
             angle += step
             
         }
     
    }
    func createArrrowsAndClock() {
        let hourArrow = UIView()
        hourArrow.frame.size = CGSize(width: 16 * scale(), height: 70 * scale())
        hourArrow.layer.borderWidth = 1
        hourArrow.layer.borderColor = UIColor.black.cgColor
        hourArrow.layer.cornerRadius = 10
        hourArrow.backgroundColor = UIColor.black
        hourArrow.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2 - hourArrow.frame.height / 2)
        self.addSubview(hourArrow)
        self.hourArrow = hourArrow
       
        let minuteArrow = UIView()
        minuteArrow.frame.size = CGSize(width: 8 * scale(), height: 90 * scale())
        minuteArrow.layer.borderWidth = 1
        minuteArrow.layer.borderColor = UIColor.black.cgColor
        minuteArrow.layer.cornerRadius = 10
        minuteArrow.backgroundColor = UIColor.green
        minuteArrow.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2 - minuteArrow.frame.height / 2)
        self.addSubview(minuteArrow)
        self.minuteArrow = minuteArrow
        
        let secondArrow = UIView()
        secondArrow.frame.size = CGSize(width: 4 * scale(), height: 95 * scale())
        secondArrow.layer.borderWidth = 1
        secondArrow.layer.borderColor = UIColor.black.cgColor
        secondArrow.layer.cornerRadius = 10
        secondArrow.backgroundColor = UIColor.red
        secondArrow.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2 - secondArrow.frame.height / 2)
        self.addSubview(secondArrow)
        self.secondArrow = secondArrow
        
    }
    
    private func movementHandClock(count: Int, index: Int, handView: UIView) {
        let step = CGFloat(2 * Double.pi / CGFloat(count))
        let x = handView.bounds.width / 4
        let y = handView.bounds.height / 2
        var transform = CGAffineTransform(translationX: x, y: y)
        transform = transform.rotated(by: CGFloat(index) * step)
        transform = transform.translatedBy(x: -x, y: -y)
        handView.transform = transform
    }
    
    func setTime(second: Int, minute: Int, hour: Int) {
        movementHandClock(count: 12, index: hour, handView: hourArrow)
        movementHandClock(count: 60, index: minute, handView: minuteArrow)
        movementHandClock(count: 60, index: second, handView: secondArrow)
    }
    
   
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0 / speed), target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        self.second += 1
      
        setTime(second: second, minute: minute, hour: hour)
    
    }
    
    func setUp() {
        self.createOblectAraundCircle()
        self.createArrrowsAndClock()
        self.setTime(second: 0, minute: 0, hour: 0)
        self.createCentreCircle()
    }
    
    func scale() -> Double {
        frame.size.height / 270.0
    }
}
