//
//  ColorLabelClockCell.swift
//  SimpleClock2
//
//  Created by Victor on 07.03.2024.
//

import UIKit

class ColorLabelClockCell: UICollectionViewCell {

    @IBOutlet private var clockView: ColorLabelClockView!

    func config(with model: ColorLabelClock) {
        clockView.config(with: model)
    }
}
