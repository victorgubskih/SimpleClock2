//
//  ClockPreviewCell.swift
//  SimpleClock2
//
//  Created by Victor on 09.01.2024.
//

import UIKit

class ClockPreviewCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var clockPlacementView: UIView!

    var preview: ClockViewFactory.Preview? {
        didSet {
            guard let preview = preview else { return }
            nameLabel.text = preview.rawValue
            removeClockSubview()
            let clockView = factory.makeClockView(with: preview)

            addClockSubview(clockView)
        }
    }

    var model: Clock? {
        didSet {
            guard let model = model else { return }
            nameLabel.text = String(describing: type(of: model))
            removeClockSubview()
            let clockView = factory.makeClockView(with: model)

            addClockSubview(clockView)
        }
    }

    let factory = ClockViewFactory()

    private func addClockSubview(_ clockView: UIView & ClockViewProtocol) {
        clockPlacementView.addSubview(clockView)
        clockView.translatesAutoresizingMaskIntoConstraints = false

        clockView.centerXAnchor.constraint(equalTo: clockPlacementView.centerXAnchor).isActive = true
        clockView.centerYAnchor.constraint(equalTo: clockPlacementView.centerYAnchor).isActive = true
        clockView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        clockView.widthAnchor.constraint(equalToConstant: 320).isActive = true

        clockView.transform = CGAffineTransform(scaleX: 60 / 320, y: 60 / 320)

        clockView.updateTime()
    }

    private func removeClockSubview() {
        if !clockPlacementView.subviews.isEmpty {
            clockPlacementView.subviews.forEach { $0.removeFromSuperview() }
        }
    }
}

