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

    @IBAction func didTapTimeZone() {
        let controller = TimeZoneController(action: update(timeZone:))
        self.present(controller, animated: true)
    }
    @IBAction func didTapTextColor() {
       let selectColorController = SelectColorControler()
        //selectColorController.delegate = self
        selectColorController.action = { color in
            self.model = CloudLabelClock(timeZone: self.model.timeZone, textColor: color)
        }
        selectColorController.selectedColor = clockView.currentColor()
        self.present(selectColorController, animated: true)
    }

}

extension EditCloudViewController {
    private func update(timeZone: TimeZone) {
        self.model = CloudLabelClock(timeZone: timeZone, textColor: model.textColor)
    }
}

//extension EditCloudViewController: SelectColorDelegate {
//    func didSelect(color: UIColor) {
//        self.model = CloudLabelClock(timeZone: model.timeZone, textColor: color)
//    }
//}
