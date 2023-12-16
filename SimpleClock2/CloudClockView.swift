//
//  CloudClockView.swift
//  SimpleClock2
//
//  Created by Victor on 08.12.2023.
//

import UIKit

class CloudClockView: UIView {
    
    @IBOutlet private(set) var circlelView: UIView!
    
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
        
        circlelView.layer.cornerRadius = circlelView.frame.height / 2
        circlelView.layer.borderWidth = 4.0
        circlelView.layer.borderColor = timeLabel.textColor.cgColor
        circlelView.clipsToBounds = true
        
        
        
    }
    
    func updateDateLabel() {
        formatter.dateFormat = "dd MMM"
        let currentDate = Date()
        let dateString = formatter.string(from: currentDate)
        dateLabel.text = dateString
    }
   
}

extension CloudClockView: ClockViewProtocol {
    func currentColor() -> UIColor {
        return timeLabel.textColor
    }
    
    func updateTime() {
        let currentDate = Date()
        formatter.dateFormat = "HH:mm:ss"
        let timeString = formatter.string(from: currentDate)
        timeLabel.text = timeString
        
        updateDateLabel()
    }
    
    func update(timeZone: TimeZone) {
        formatter.timeZone = timeZone
        updateTime()
    }
    
    func update(color: UIColor) {
        timeLabel.textColor = color
        dateLabel.textColor = color
        circlelView.layer.borderColor = color.cgColor
        
    }
    
    func currentTimeZone() -> TimeZone {
        return formatter.timeZone
    }
}