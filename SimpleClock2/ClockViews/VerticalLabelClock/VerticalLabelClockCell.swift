//
//  VerticalLabelClockCell.swift
//  SimpleClock2
//
//  Created by Victor on 07.03.2024.
//

import UIKit

class VerticalLabelClockCell: UICollectionViewCell {

    @IBOutlet private var clockView: VerticalLabelClockView!

    func config(with model: VerticalLabelClock) {
        clockView.config(with: model)
    }
}
