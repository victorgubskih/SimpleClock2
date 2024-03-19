//
//  LabelClockCell.swift
//  SimpleClock2
//
//  Created by Victor on 06.03.2024.
//

import UIKit

class LabelClockCell: UICollectionViewCell {

    @IBOutlet private var clockView: LabelClockView!

    func config(with model: LabelClock) {
        clockView.config(with: model)
    }
}
