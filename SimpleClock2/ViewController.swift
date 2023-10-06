//
//  ViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private(set) var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
       
        updateTimeLabel()
    }
    
    @objc func fireTimer() {
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let timeStr = formatter.string(from: currentDate)
        timeLabel.text = timeStr
    }
    
}

