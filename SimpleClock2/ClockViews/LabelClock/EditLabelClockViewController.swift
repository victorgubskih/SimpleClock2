//
//  EditLabelClockViewController.swift
//  SimpleClock2
//
//  Created by Victor on 26.03.2024.
//

import UIKit

class EditLabelClockViewController: UIViewController {

    @IBOutlet private var clockView: LabelClockView!

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


}
