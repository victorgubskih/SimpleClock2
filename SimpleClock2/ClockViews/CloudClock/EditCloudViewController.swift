//
//  EditCloudViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.04.2024.
//

import UIKit

class EditCloudViewController: UIViewController {

    @IBOutlet private var clockView: CloudClockView!
    private var model = CloudLabelClock(timeZone: .current, textColor: .black) {
        didSet {
            clockView?.config(with: model)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        clockView.config(with: model)
    }

    func config(with model: CloudLabelClock) {
        self.model = model
    }

}
