//
//  GalleryViewController.swift
//  SimpleClock2
//
//  Created by Victor on 04.03.2024.
//

import UIKit

class GalleryViewController: UIViewController {

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
        JustClock(timeZone: .current, background: .green),
        JustClock(timeZone: .current, background: .blue),
        JustClock(timeZone: .current, background: .gray)
    ] {
        didSet {
            repository.save(clocks: clocks)
        }
    }

    @IBOutlet private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "LabelClockCell", bundle: nil), forCellWithReuseIdentifier: "LabelClockCell")
        collectionView.register(UINib(nibName: "ColorLabelClockCell", bundle: nil), forCellWithReuseIdentifier: "ColorLabelClockCell")
        collectionView.register(UINib(nibName: "VerticalLabelClockCell", bundle: nil), forCellWithReuseIdentifier: "VerticalLabelClockCell")
        collectionView.register(UINib(nibName: "CloudLabelClockCell", bundle: nil), forCellWithReuseIdentifier: "CloudLabelClockCell")
        collectionView.register(UINib(nibName: "JustClockCell", bundle: nil), forCellWithReuseIdentifier: "JustClockCell")

        let savedClocks = repository.clocks()
        if !savedClocks.isEmpty {
            clocks = savedClocks
            collectionView.reloadData()
        }
    }

    @IBAction func edit() {
        guard let index = collectionView.indexPathsForVisibleItems.first?.item else {
            return
        }
        guard index < clocks.count else {
            return
        }
        let clock = clocks[index]
        switch clock {
        case let labelClock as LabelClock:
            let storyboard = UIStoryboard(name: String(describing: EditLabelClockViewController.self), bundle: nil)
            let editViewController = storyboard.instantiateViewController(identifier: "edit") as! EditLabelClockViewController
            editViewController.config(with: labelClock)
            self.present(editViewController, animated: true)
            editViewController.saveAction = { model in
                self.clocks[index] = model
                self.collectionView.reloadData()
            }
        case let verticalLabelClock as VerticalLabelClock:
            let storyBoard = UIStoryboard(name: String(describing: EditVerticalViewController.self), bundle: nil)
            let editVerticalViewController = storyBoard.instantiateViewController(identifier: "edit") as! EditVerticalViewController
            editVerticalViewController.config(with: verticalLabelClock)
            self.present(editVerticalViewController, animated: true)
            editVerticalViewController.saveAction = { model in
                self.clocks[index] = model
                self.collectionView.reloadData()
            }

        case let colorlabelClock as ColorLabelClock:
            let storybord = UIStoryboard(name: String(describing: EditColorLabelViewController.self), bundle: nil)
            let editColoLabelrViewControllert = storybord.instantiateViewController(identifier: "edit") as! EditColorLabelViewController
            editColoLabelrViewControllert.config(with: colorlabelClock)
            self.present(editColoLabelrViewControllert, animated: true)
            editColoLabelrViewControllert.saveAction = { model in
                self.clocks[index] = model
                self.collectionView.reloadData()
            }

        case let cloudLabelClock as CloudLabelClock:
            let storyboard = UIStoryboard(name: String(describing: EditCloudViewController.self), bundle: nil)
            let editCloudClockViewController = storyboard.instantiateViewController(identifier: "edit") as! EditCloudViewController
            editCloudClockViewController.config(with: cloudLabelClock)
            self.present(editCloudClockViewController, animated: true)
            editCloudClockViewController.saveAction = { model in
                self.clocks[index] = model
                self.collectionView.reloadData()
            }

        case let justClock as JustClock:
            let storyboard = UIStoryboard(name: String(describing: EditJustViewController.self), bundle: nil)
            let editJustClockViewController = storyboard.instantiateViewController(identifier: "edit") as! EditJustViewController
            editJustClockViewController.config(with: justClock)
            self.present(editJustClockViewController, animated: true)
            editJustClockViewController.saveAction = {model in
                self.clocks[index] = model
                self.collectionView.reloadData()
            }
        default:
            break

        }
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
