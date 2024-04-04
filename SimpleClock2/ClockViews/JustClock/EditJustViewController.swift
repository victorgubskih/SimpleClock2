//
//  Edit JustViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.04.2024.
//

import UIKit

class EditJustViewController: UIViewController {
    @IBOutlet private var clockView: JustClockView!
    private var model = JustClock(timeZone: .current, background: .white) {
        didSet {
            clockView?.config(with: model)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        clockView.config(with: model)

    }
    func config(with model: JustClock) {
        self.model = model
    }

    @IBAction func didTapTimeZone() {
        let controller = TimeZoneController(action: update(timeZone:))
        self.present(controller, animated: true)
    }
}

extension EditJustViewController {
    private func update(timeZone: TimeZone) {
        self.model = JustClock(timeZone: timeZone, background: model.background)
    }
}
