//
//  EditcolorLabelViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.04.2024.
//

import UIKit

class EditColorLabelViewController: UIViewController {
    @IBOutlet private var clockView: ColorLabelClockView!
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

}