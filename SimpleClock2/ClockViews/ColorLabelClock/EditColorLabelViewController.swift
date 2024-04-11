//
//  EditcolorLabelViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.04.2024.
//

import UIKit

class EditColorLabelViewController: UIViewController {

//    private enum ColorButtonContext {
//        case text
//        case srartColor
//        case finishColor
//    }
    @IBOutlet private var clockView: ColorLabelClockView!

    //private var colorButtonContext: ColorButtonContext?

    private var  model = ColorLabelClock(timeZone: .current, textColor: .black, srartColor: .white, finishColor: .red) {
        didSet {
            clockView?.config(with: model)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        clockView.config(with: model)
    }

    func config(with model: ColorLabelClock) {
        self.model = model
    }

    @IBAction func didTapTimeZone() {
        let controller = TimeZoneController(action: update(timeZone:))
        self.present(controller, animated: true)
    }

    @IBAction func didTapTextColor() {
       let selectColorController = SelectColorControler()
        selectColorController.selectedColor = clockView.currentColor()
       // selectColorController.delegate = self
        selectColorController.action = { color in
            self.model = ColorLabelClock(timeZone: self.model.timeZone, textColor: color, srartColor: self.model.srartColor, finishColor: self.model.finishColor)
        }
        self.present(selectColorController, animated: true)
       // colorButtonContext = .text
    }

    @IBAction func didTapStartColor() {
       let selectColorController = SelectColorControler()
        selectColorController.selectedColor = clockView.currentColor()
        //selectColorController.delegate = self
        selectColorController.action = {color in
            self.model = ColorLabelClock(timeZone: self.model.timeZone, textColor: self.model.textColor, srartColor: color, finishColor: self.model.finishColor)
        }
        self.present(selectColorController, animated: true)
       // colorButtonContext = .srartColor
    }

    @IBAction func didTapFinishColor() {
       let selectColorController = SelectColorControler()
        selectColorController.selectedColor = clockView.currentColor()
        //selectColorController.delegate = self
        selectColorController.action = {color in
            self.model = ColorLabelClock(timeZone: self.model.timeZone, textColor: self.model.textColor, srartColor: self.model.srartColor, finishColor: color)
        }
        self.present(selectColorController, animated: true)
       // colorButtonContext = .finishColor
    }

}
extension EditColorLabelViewController {
    private func update(timeZone: TimeZone) {
        self.model = ColorLabelClock(timeZone: timeZone, textColor: model.textColor, srartColor: model.srartColor, finishColor: model.finishColor)
    }

}
//extension EditColorLabelViewController: SelectColorDelegate {
//    func didSelect(color: UIColor) {
//        guard let colorButtonContext = colorButtonContext else {
//            return
//        }
//        switch colorButtonContext{
//        case .text:
//            self.model = ColorLabelClock(timeZone: model.timeZone, textColor: color, srartColor: model.srartColor, finishColor: model.finishColor)
//        case .srartColor:
//            self.model = ColorLabelClock(timeZone: model.timeZone, textColor: model.textColor, srartColor: color, finishColor: model.finishColor)
//        case .finishColor:
//            self.model = ColorLabelClock(timeZone: model.timeZone, textColor: model.textColor, srartColor: model.srartColor, finishColor: color)
//        ç
//        self.colorButtonContext = nil
//    }
//}

