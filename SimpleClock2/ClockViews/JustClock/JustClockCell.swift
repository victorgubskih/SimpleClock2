//
//  JustClockCell.swift
//  SimpleClock2
//
//  Created by Victor on 07.03.2024.
//

import UIKit

class JustClockCell: UICollectionViewCell {

    @IBOutlet private var clockView: JustClockView!

    func config(with model: JustClock) {
        clockView.config(with: model)
    }


}
