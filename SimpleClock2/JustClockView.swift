//
//  JustClockView.swift
//  SimpleClock2
//
//  Created by Victor on 12.12.2023.
//

import UIKit


class JustClockView: UIView {
    
    @IBOutlet private(set) var circlelView1: UIView!

    @IBOutlet private(set) var secondHandView: UIView!
    @IBOutlet private(set) var secondsHandsContainer: UIView!
    
    @IBOutlet private(set) var minuteHandsContainer: UIView!
    @IBOutlet private(set) var minuteHandView: UIView!
    
    @IBOutlet private(set) var hourHandsContainer: UIView!
    @IBOutlet private(set) var hourHandView: UIView!
    var calendar = Calendar.current
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)
        setupFromNib()
        
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupFromNib()
       
    }
    
    private func setupFromNib() {
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self).first as? UIView else {
            return
        }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        hourHandView.layer.cornerRadius = 10
        hourHandView.layer.borderWidth = 1.0
        hourHandView.clipsToBounds = true
        
        minuteHandView.layer.cornerRadius = 10
        minuteHandView.layer.borderWidth = 1.0
        minuteHandView.clipsToBounds = true
        
        secondHandView.layer.cornerRadius = 10
        secondHandView.layer.borderWidth = 1.0
        secondHandView.clipsToBounds = true
    }
}

extension JustClockView: ClockViewProtocol {
    func currentColor() -> UIColor {
        return hourHandView.backgroundColor ?? .clear
    }
    
    func updateTime() {
        let currentDate = Date()
        
        let components = calendar.dateComponents([.second, .minute, .hour], from: currentDate)
        
        let hours = CGFloat(components.hour ?? 0)
        hourHandsContainer.transform = CGAffineTransform(rotationAngle: (2 * CGFloat.pi * hours / 12.0))
       
        let minutes = CGFloat(components.minute ?? 0)
        minuteHandsContainer.transform = CGAffineTransform(rotationAngle: (2 * CGFloat.pi * minutes / 60.0))
        
        let seconds = CGFloat(components.second ?? 0)
        secondsHandsContainer.transform = CGAffineTransform(rotationAngle: (2 * CGFloat.pi * seconds / 60.0))
       
    }
    
    func update(timeZone: TimeZone) {
        calendar.timeZone = timeZone
        updateTime()
    }
    
    func update(color: UIColor) {
        hourHandView.backgroundColor = color
        minuteHandView.backgroundColor = color
        secondHandView.backgroundColor = color
        
    }
    
    func currentTimeZone() -> TimeZone {
        return calendar.timeZone
    }
}

