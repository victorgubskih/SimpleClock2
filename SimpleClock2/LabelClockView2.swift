//
//  LabelClockView2.swift
//  SimpleClock2
//
//  Created by Victor on 07.11.2023.
//

import UIKit

class LabelClockView2: UIView {

    @IBOutlet private(set) var clockView: UILabel!
    private let formatter = DateFormatter()
    
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
        
        formatter.dateFormat =  "HH:mm:ss"
        formatter.timeZone = TimeZone.current
    }
}
//MARK: ClockViewForProtocol
extension LabelClockView2: ClockViewProtocol {
    
    
    func updateTimeLabel() {
        let currentDate = Date()
        let timeString = formatter.string(from: currentDate)
        clockView.text = timeString
    }
    
    func upgate(timeZone: TimeZone) {
        formatter.timeZone = timeZone
        updateTimeLabel()
    }
    
    func update(color: UIColor) {
        clockView.textColor = color
    }
    
    func currentTimeZone() -> TimeZone {
        return formatter.timeZone
    }
}
