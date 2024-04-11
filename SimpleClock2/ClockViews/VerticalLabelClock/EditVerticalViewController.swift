//
//  EditVerticalViewController.swift
//  SimpleClock2
//
//  Created by Victor on 02.04.2024.
//

import UIKit

class EditVerticalViewController: UIViewController {

//    private enum ColorButtonContext {
//        case text
//        case background
//    }

    @IBOutlet private var clockView: VerticalLabelClockView!

//    private var colorButtonContext: ColorButtonContext?
    
    private var model = VerticalLabelClock(timeZone: .current, textColor: .black, backgroundColor: .white) {
        didSet {
            clockView?.config(with: model)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        clockView.config(with: model)
    }

    func config(with model: VerticalLabelClock) {
        self.model =  model
    }

    @IBAction func didTapTimeZone() {
        let controller = TimeZoneController(action: update(timeZone:))
        self.present(controller, animated: true)
    }

    @IBAction func didTapTextColor() {
       let selectColorController = SelectColorControler()
        //selectColorController.delegate = self
        selectColorController.action = { color in
            self.model = VerticalLabelClock(timeZone: self.model.timeZone, textColor: color, backgroundColor: self.model.backgroundColor)
        }
        selectColorController.selectedColor = clockView.currentColor()
        self.present(selectColorController, animated: true)
        //colorButtonContext = .text
    }

    @IBAction func didTapBackground() {
       let selectColorController = SelectColorControler()
        //selectColorController.delegate = self
        selectColorController.action = { color in
            self.model = VerticalLabelClock(timeZone: self.model.timeZone, textColor: self.model.textColor, backgroundColor: color)
        }
        selectColorController.selectedColor = clockView.currentColor()
        self.present(selectColorController, animated: true)
       // colorButtonContext = .background
    }

}

extension EditVerticalViewController {
    private func update(timeZone: TimeZone) {
        self.model = VerticalLabelClock(timeZone: timeZone, textColor: model.textColor, backgroundColor: model.backgroundColor)
    }
}

//extension EditVerticalViewController: SelectColorDelegate {
//    func didSelect(color: UIColor) {
//        guard let colorButtonContext = colorButtonContext else {
//            return
//        }
//        switch colorButtonContext {
//        case .text:
//            self.model = VerticalLabelClock(timeZone: model.timeZone, textColor: color, backgroundColor: model.backgroundColor)
//        case .background:
//            self.model = VerticalLabelClock(timeZone: model.timeZone, textColor: model.textColor, backgroundColor: color)
//
//        }
//        self.colorButtonContext = nil
//    }
//}
