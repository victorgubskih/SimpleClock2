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
    let startColor = UIColor.white
    let finishColor = UIColor.red
    var startTime: Date!
    var finishTime: Date!
    
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
        
        updateTimeInterval()
    }
    
    func updateTimeInterval() {
        let currentDate = Date()
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: currentDate)
        startTime = calendar.date(from: dateComponents)!
        finishTime = calendar.date(byAdding: .minute, value: 1, to: startTime)!
    }
    
    func currentColor(for currentDate: Date) -> UIColor {
        var red1: CGFloat = 0
        var green1: CGFloat = 0
        var blue1: CGFloat = 0
        var alpha1: CGFloat = 0
        startColor.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        let start = startTime.timeIntervalSince1970
        
        var red2: CGFloat = 0
        var green2: CGFloat = 0
        var blue2: CGFloat = 0
        var alpha2: CGFloat = 0
        finishColor.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        let finish = finishTime.timeIntervalSince1970
        
        let current = currentDate.timeIntervalSince1970
        let proportion = CGFloat((current - start) / (finish - start))
        var red: Float = Float(red1 + proportion * (red2 - red1))
        var green: Float = Float(green1 + proportion * (green2 - green1))
        var blue: Float = Float(blue1 + proportion * (blue2 - blue1))
        var alpha: Float = Float(alpha1 + proportion * (alpha2 - alpha1))
        return UIColor(_colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
    }
    
}
//MARK: ClockViewForProtocol
extension LabelClockView2: ClockViewProtocol {
    
    func updateTimeLabel() {
        let currentDate = Date()
        let timeString = formatter.string(from: currentDate)
        clockView.text = timeString
        
        if currentDate >= finishTime {
            updateTimeInterval()
        }
        clockView.backgroundColor = currentColor(for: currentDate)
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
