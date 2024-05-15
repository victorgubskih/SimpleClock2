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
            if !clockPlacementView.subviews.isEmpty {
                clockPlacementView.subviews.forEach { $0.removeFromSuperview() }
            }
            let clockView = factory.makeClockView(with: preview)

            clockPlacementView.addSubview(clockView)
            clockView.translatesAutoresizingMaskIntoConstraints = false

            clockView.centerXAnchor.constraint(equalTo: clockPlacementView.centerXAnchor).isActive = true
            clockView.centerYAnchor.constraint(equalTo: clockPlacementView.centerYAnchor).isActive = true
            clockView.heightAnchor.constraint(equalToConstant: 320).isActive = true
            clockView.widthAnchor.constraint(equalToConstant: 320).isActive = true

            clockView.transform = CGAffineTransform(scaleX: 60 / 320, y: 60 / 320)

//            clockView.topAnchor.constraint(equalTo: clockPlacementView.topAnchor).isActive = true
//            clockView.leftAnchor.constraint(equalTo: clockPlacementView.leftAnchor).isActive = true
//            clockView.bottomAnchor.constraint(equalTo: clockPlacementView.bottomAnchor).isActive = true
//            clockView.rightAnchor.constraint(equalTo: clockPlacementView.rightAnchor).isActive = true
//
            clockView.updateTime()
        }
    }

    var model: Clock? {
        didSet {
            guard let model = model else { return }
            nameLabel.text = String(describing: type(of: model))
            if !clockPlacementView.subviews.isEmpty {
                clockPlacementView.subviews.forEach { $0.removeFromSuperview() }
            }
            let clockView = factory.makeClockView(with: model)

            clockPlacementView.addSubview(clockView)
            clockView.translatesAutoresizingMaskIntoConstraints = false

            clockView.centerXAnchor.constraint(equalTo: clockPlacementView.centerXAnchor).isActive = true
            clockView.centerYAnchor.constraint(equalTo: clockPlacementView.centerYAnchor).isActive = true
            clockView.heightAnchor.constraint(equalToConstant: 320).isActive = true
            clockView.widthAnchor.constraint(equalToConstant: 320).isActive = true

            clockView.transform = CGAffineTransform(scaleX: 60 / 320, y: 60 / 320)

//            clockView.topAnchor.constraint(equalTo: clockPlacementView.topAnchor).isActive = true
//            clockView.leftAnchor.constraint(equalTo: clockPlacementView.leftAnchor).isActive = true
//            clockView.bottomAnchor.constraint(equalTo: clockPlacementView.bottomAnchor).isActive = true
//            clockView.rightAnchor.constraint(equalTo: clockPlacementView.rightAnchor).isActive = true
//
            clockView.updateTime()
        }
    }

    let factory = ClockViewFactory()
}
