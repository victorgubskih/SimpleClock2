//
//  ViewController.swift
//  SimpleClock4
//
//  Created by Victor on 10.02.2024.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet private(set) var clockView: ClockViewProtocol!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeZoneButton: UIButton!
    @IBOutlet weak var colorButton: UIButton!

    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)

        clockView.updateTimeLabel()
    }

    @objc func fireTimer() {
        clockView.updateTimeLabel()
    }

    @IBAction func buttonAction(sender: UIButton) {
        if timer.isValid {
            sender.setTitle("Start", for: .normal)
            timer.invalidate()
        } else {
            sender.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }

    @IBAction func timeZoneAction(sender: UIButton) {
        let timeZoneControler = TimeZoneControler()
        timeZoneControler.selectedTimeZone = clockView.currentTimeZone()
        timeZoneControler.delegate = self
        self.present(timeZoneControler, animated: true)

    }
    @IBAction func colorAction(sender: UIButton) {
        let selectColorControler = SelectColorController()
        selectColorControler.delegate = self
        self.present(selectColorControler, animated: true)
    }



}

//MARK: SelectTimeZoneDelegate
extension ViewController: SelectTimeZoneDelegate {
    func didSelect(timeZone: TimeZone) {
        //formatter.timeZone = timeZone
        clockView.update(timeZone: timeZone)
    }
}

//MARK: SelectColorDelegate
extension ViewController: SelectColorDelegate {
    func didSelect(color: UIColor) {
        colorButton.setTitleColor(color, for: .normal)
        //timeLabel.textColor = color
        clockView.update(color: color)
    }
}
