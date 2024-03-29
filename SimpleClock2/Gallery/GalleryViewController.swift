//
//  GalleryViewController.swift
//  SimpleClock2
//
//  Created by Victor on 04.03.2024.
//

import UIKit

class GalleryViewController: UIViewController {

    private var previews: [ClockViewFactory.Preview] = [.label, .cloudLabel, .colorLabel]

    private var clocks: [Clock] = [
        LabelClock(timeZone: .current, textColor: .black, backgroundColor: .white),
        LabelClock(timeZone: .current, textColor: .green, backgroundColor: .blue),
        LabelClock(timeZone: .current, textColor: .red, backgroundColor: .green),
        VerticalLabelClock(timeZone: .current, textColor: .black, backgroundColor: .brown),
        VerticalLabelClock(timeZone: .current, textColor: .green, backgroundColor: .blue),
        VerticalLabelClock(timeZone: .current, textColor: .red, backgroundColor: .brown),

        ColorLabelClock(timeZone: .current, textColor: .yellow, srartColor: .white, finishColor: .red),
        ColorLabelClock(timeZone: .current, textColor: .brown, srartColor: .white, finishColor: .red),
        ColorLabelClock(timeZone: .current, textColor: .gray, srartColor: .white, finishColor: .red),
        CloudLabelClock(timeZone: .current, textColor: .black),
        CloudLabelClock(timeZone: .current, textColor: .blue),
        CloudLabelClock(timeZone: .current, textColor: .green),
        JustClock(timeZone: .current),
        JustClock(timeZone: .current),
        JustClock(timeZone: .current)
    ]

    @IBOutlet private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "LabelClockCell", bundle: nil), forCellWithReuseIdentifier: "LabelClockCell")
        collectionView.register(UINib(nibName: "ColorLabelClockCell", bundle: nil), forCellWithReuseIdentifier: "ColorLabelClockCell")
        collectionView.register(UINib(nibName: "VerticalLabelClockCell", bundle: nil), forCellWithReuseIdentifier: "VerticalLabelClockCell")
        collectionView.register(UINib(nibName: "CloudLabelClockCell", bundle: nil), forCellWithReuseIdentifier: "CloudLabelClockCell")
        collectionView.register(UINib(nibName: "JustClockCell", bundle: nil), forCellWithReuseIdentifier: "JustClockCell")

        previews = ClockViewFactory().makePreviews()
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clocks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch clocks[indexPath.row] {

        case let labelClock as LabelClock:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelClockCell", for: indexPath) as! LabelClockCell
            clockCell.config(with: labelClock)
            return clockCell

        case let verticalLabelClock as VerticalLabelClock:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalLabelClockCell", for: indexPath) as! VerticalLabelClockCell
            clockCell.config(with: verticalLabelClock)
            return clockCell

        case let colorLabelClock as ColorLabelClock:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorLabelClockCell", for: indexPath) as! ColorLabelClockCell
            clockCell.config(with: colorLabelClock)
            return clockCell

        case let cloudLabelClock as CloudLabelClock:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CloudLabelClockCell", for: indexPath) as! CloudLabelClockCell
            clockCell.config(with: cloudLabelClock)
            return clockCell

        case let justClock as JustClock:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JustClockCell", for: indexPath) as! JustClockCell
            clockCell.config(with: justClock)
            return clockCell

//        case .yelowLabel:
//            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        case .greenBlueLabel:
//            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        }

    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
