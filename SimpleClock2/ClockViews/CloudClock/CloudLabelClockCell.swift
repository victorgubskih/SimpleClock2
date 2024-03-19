//
//  CloudLabelClockCell.swift
//  SimpleClock2
//
//  Created by Victor on 07.03.2024.
//

import UIKit

class CloudLabelClockCell: UICollectionViewCell {

    @IBOutlet private var clockView: CloudClockView!

    func config(with model: CloudLabelClock) {
        clockView.config(with: model)
    }

}
