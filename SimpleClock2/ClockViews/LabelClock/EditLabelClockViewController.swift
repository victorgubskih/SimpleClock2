//
//  EditLabelClockViewController.swift
//  SimpleClock2
//
//  Created by Victor on 26.03.2024.
//

import UIKit

class EditLabelClockViewController: UIViewController, UIColorPickerViewControllerDelegate {

//    private enum ColorButtonContext {
//        case text
//        case background
//        
//    }

    @IBOutlet private var clockView: LabelClockView!
    
   // private var colorButtonContext: ColorButtonContext?

    private var model = LabelClock(timeZone: .current, textColor: .black, backgroundColor: .white) {
        didSet {
            clockView?.config(with: model)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        clockView.config(with: model)

    }

    func config(with model: LabelClock) {
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
            self.model = LabelClock(timeZone: self.model.timeZone, textColor: color, backgroundColor: self.model.backgroundColor)
        }
        selectColorController.selectedColor = clockView.currentColor()
        self.present(selectColorController, animated: true)
        //colorButtonContext = .text
    }

    @IBAction func didTapBackground() {
        let selectColorController = SelectColorControler()
        //selectColorController.delegate = self
        selectColorController.action = { color in
            self.model = LabelClock(timeZone: self.model.timeZone, textColor: self.model.textColor,  backgroundColor: color)
        }
        selectColorController.selectedColor = clockView.currentColor()
        self.present(selectColorController, animated: true)
        //colorButtonContext = .background
    }
}

extension EditLabelClockViewController {
    private func update(timeZone: TimeZone) {
        self.model = LabelClock(timeZone: timeZone, textColor: model.textColor, backgroundColor: model.backgroundColor)
    }
}

//extension EditLabelClockViewController: SelectColorDelegate {
//    func didSelect(color: UIColor) {
//        guard let colorButtonContext = colorButtonContext else {
//            return
//        }
//        switch colorButtonContext {
//        case .text:
//            self.model = LabelClock(timeZone: model.timeZone, textColor: color, backgroundColor: model.backgroundColor)
//        case .background:
//            self.model = LabelClock(timeZone: model.timeZone, textColor: model.textColor,  backgroundColor: color)
//        }
//        self.colorButtonContext = nil
//    }
//}
