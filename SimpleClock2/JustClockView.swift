//
//  JustClockView.swift
//  SimpleClock2
//
//  Created by Victor on 12.12.2023.
//

import UIKit


class JustClockView: UIView {
    
    @IBOutlet private(set) var circlelView1: UIView!
    
    @IBOutlet private(set) var dateLabel: UILabel!
    
    @IBOutlet private(set) var timeLabel: UILabel!

    private let formatter = DateFormatter()
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)
        setupFromNib()
        
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       setupFromNib()
       
    }
    
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        setupFromNib()
        self.timeLabel.backgroundColor = backgroundColor
        
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
        
        formatter.dateFormat = "HH:mm:ss"
        
        formatter.timeZone = TimeZone.current
        
        circlelView1.layer.cornerRadius = circlelView1.frame.height / 2
        circlelView1.layer.borderWidth = 4.0
        //circlelView1.layer.borderColor = timeLabel.textColor.cgColor
        circlelView1.clipsToBounds = true
        
        
        
    }
    
    /*func updateDateLabel() {
        formatter.dateFormat = "dd MMM"
        let currentDate = Date()
        let dateString = formatter.string(from: currentDate)
        dateLabel.text = dateString
    }*/
   
}

extension JustClockView: ClockViewProtocol {
    func currentColor() -> UIColor {
        return .red //timeLabel.textColor
    }
    
    func updateTime() {
        let currentDate = Date()
        formatter.dateFormat = "HH:mm:ss"
        let timeString = formatter.string(from: currentDate)
        //timeLabel.text = timeString
        
       // updateDateLabel()
    }
    
    func update(timeZone: TimeZone) {
        formatter.timeZone = timeZone
        updateTime()
    }
    
    func update(color: UIColor) {
       // timeLabel.textColor = color
       // dateLabel.textColor = color
        circlelView1.layer.borderColor = color.cgColor
        
    }
    
    func currentTimeZone() -> TimeZone {
        return formatter.timeZone
    }
}

