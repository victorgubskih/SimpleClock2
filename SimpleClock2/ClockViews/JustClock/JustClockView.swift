//
//  JustClockView.swift
//  SimpleClock2
//
//  Created by Victor on 12.12.2023.
//

import UIKit

class JustClockView: UIView {

    @IBOutlet private(set) var circlelView1: UIView!

    @IBOutlet private(set) var secondsHandsContainer: UIView!

    @IBOutlet private(set) var minuteHandsContainer2: UIView!

    @IBOutlet private(set) var hourHandsContainer2: UIView!
    var calendar = Calendar.current
    var timer: Timer?

    private(set) var model: JustClock = .init(timeZone: .current) {
        didSet {
            calendar.timeZone = model.timeZone
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }

    deinit {
        timer?.invalidate()
    }

    func config(with model: JustClock) {
        self.model = model
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

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        updateTime()
    }

}

extension JustClockView: ClockViewProtocol {
    func currentColor() -> UIColor {
        return self.backgroundColor ?? .clear
    }

    func updateTime() {
        let currentDate = Date()

        let components = calendar.dateComponents([.second, .minute, .hour], from: currentDate)

        let hours = CGFloat(components.hour ?? 0)

        hourHandsContainer2.transform = CGAffineTransform(rotationAngle: (2 * CGFloat.pi * hours / 12.0))

        let minutes = CGFloat(components.minute ?? 0)

        minuteHandsContainer2.transform = CGAffineTransform(rotationAngle: (2 * CGFloat.pi * minutes / 60.0))

        let seconds = CGFloat(components.second ?? 0)

        secondsHandsContainer.transform = CGAffineTransform(rotationAngle: (2 * CGFloat.pi * seconds / 60.0))
    }


    func update(timeZone: TimeZone) {
        calendar.timeZone = timeZone
        updateTime()
    }

    func update(color: UIColor) {
        self.backgroundColor = color

    }

    func currentTimeZone() -> TimeZone {
        return calendar.timeZone
    }
}
