//
//  GalleryViewController.swift
//  SimpleClock2
//
//  Created by Victor on 04.03.2024.
//

import UIKit

class GalleryViewController: UIViewController {

    private var previews: [ClockViewFactory.Preview] = [.label, .cloudLabel, .colorLabel]
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
        return previews.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch previews[indexPath.row] {

        case .label:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelClockCell", for: indexPath) as! LabelClockCell
            return clockCell

        case .colorLabel:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorLabelClockCell", for: indexPath) as! ColorLabelClockCell
            return clockCell

        case .verticalLabel:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalLabelClockCell", for: indexPath) as! VerticalLabelClockCell
            return clockCell

        case .cloudLabel:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CloudLabelClockCell", for: indexPath) as! CloudLabelClockCell
            return clockCell

        case .justClockView:
            let clockCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JustClockCell", for: indexPath) as! JustClockCell
            return clockCell

        case .yelowLabel:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        case .greenBlueLabel:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        }

    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
