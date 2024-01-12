//
//  ViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.10.2023.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet private(set) var clockView: ClockViewProtocol!
   
    @IBOutlet weak var startButton: UIButton!

    @IBOutlet weak var timeZoneButton: UIButton!
    
    @IBOutlet weak var colorButton: UIButton!
    
    @IBOutlet weak var clockButton: UIButton!
    
    @IBOutlet weak var contentStackView: UIStackView!
    
    var timer: Timer!
    let timeInterval = TimeInterval(1)
    let clocks: [ClockViewProtocol & UIView] = [LabelClockView(), ColorLabelClockView(), VerticalLabelClockView()]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let previewStr = UserDefaults.standard.string(forKey: ClockViewFactory.Preview.key), let preview = ClockViewFactory.Preview(rawValue: previewStr) {
            let clockView = ClockViewFactory().makeClockView(with: preview)
            didSelect(clock: clockView)
        }
        
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        clockView.updateTime()
    }
    
    @objc func fireTimer() {
        clockView.updateTime()
    }
    
   
    @IBAction func startAction(sender: UIButton) {
        if timer.isValid  {
            sender.setTitle("Start", for: .normal)
            timer.invalidate()
        } else {
            sender.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func timeZoneAction(sender: UIButton) {
        let timeZoneControler = TimeZoneController(action: { timeZone in self.clockView.update(timeZone: timeZone) })
        timeZoneControler.selectedTimeZone = clockView.currentTimeZone()
//        timeZoneControler.delegate = self
        self.present(timeZoneControler, animated: true)
    }
    
    @IBAction func colorAction(sender: UIButton) {
        let selectColorControler = SelectColorControler()
        selectColorControler.delegate = self
        self.present(selectColorControler, animated: true)
    }
    
    @IBAction func clockAction() {
        let selectClockControler = SelectClockController()
        selectClockControler.delegate = self
        self.present(selectClockControler, animated: true)
        
        
    }
}

// MARK: SelectTimeZoneDelegate
//extension ViewController: SelectTimeZoneDelegate {
//    func didSelect(timeZone: TimeZone) {
//        
//        clockView.update(timeZone: timeZone)
//    }
//}

// MARK: SelectColorDelegate
extension ViewController: SelectColorDelegate {
    func didSelect(color: UIColor) {
        colorButton.setTitleColor(color, for: .reserved)
        clockView.update(color: color)
    }
}

extension ViewController: SelectClockDelegate {
    func didSelect(clock: UIView & ClockViewProtocol) {
        contentStackView.arrangedSubviews.first?.removeFromSuperview()
        contentStackView.insertArrangedSubview(clock, at: 0)
        let oldClockView = clockView
        clockView = clock
        clockView.update(timeZone: oldClockView!.currentTimeZone())
        clockView.update(color: oldClockView!.currentColor())
        clockView.updateTime()
        
    }
}

