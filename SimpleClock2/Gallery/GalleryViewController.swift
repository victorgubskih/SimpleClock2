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
        case .yelowLabel:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        case .colorLabel:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        case .greenBlueLabel:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        case .verticalLabel:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        case .cloudLabel:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        case .justClockView:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        }

    }
    

}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
