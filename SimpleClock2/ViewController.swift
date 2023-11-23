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
        
        clockAction()
        
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        clockView.updateTimeLabel()
    }
    
    @objc func fireTimer() {
        clockView.updateTimeLabel()
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
        let timeZoneControler = TimeZoneController()
        timeZoneControler.selectedTimeZone = clockView.currentTimeZone()
        timeZoneControler.delegate = self
        self.present(timeZoneControler, animated: true)
    }
    
    @IBAction func colorAction(sender: UIButton) {
        let selectColorControler = SelectColorControler()
        selectColorControler.delegate = self
        self.present(selectColorControler, animated: true)
    }
    
    @IBAction func clockAction() {
        let currentClockView = contentStackView.arrangedSubviews.first as? ClockViewProtocol
        if let index = clocks.firstIndex(where: { $0 === currentClockView}), index + 1 < clocks.count {
            contentStackView.arrangedSubviews.first?.removeFromSuperview()
            contentStackView.insertArrangedSubview(clocks[index + 1], at: 0)
            clockView = clocks[index + 1]
        } else {
            contentStackView.arrangedSubviews.first?.removeFromSuperview()
            contentStackView.insertArrangedSubview(clocks[0], at: 0)
            clockView = clocks[0]
        }
    }
}

// MARK: SelectTimeZoneDelegate
extension ViewController: SelectTimeZoneDelegate {
    func didSelect(timeZone: TimeZone) {
        //formatter.timeZone = timeZone
        clockView.upgate(timeZone: timeZone)
    }
}

// MARK: SelectColorDelegate
extension ViewController: SelectColorDelegate {
    func didSelect(color: UIColor) {
        colorButton.setTitleColor(color, for: .reserved)
        //timeLabel.textColor = color
        clockView.update(color: color)
    }
}
