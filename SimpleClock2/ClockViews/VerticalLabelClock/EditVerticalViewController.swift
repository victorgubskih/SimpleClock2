//
//  EditVerticalViewController.swift
//  SimpleClock2
//
//  Created by Victor on 02.04.2024.
//

import UIKit

class EditVerticalViewController: UIViewController {

    @IBOutlet private var clockView: VerticalLabelClockView!
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
}