//
//  ChooseClockViewController.swift
//  SimpleClock2
//
//  Created by Victor on 13.05.2024.
//

import UIKit
protocol ChooseClockDelegate: AnyObject {
    func didSelect(clock: Clock)
}
class ChooseClockViewController: UIViewController {

    var delegate: ChooseClockDelegate? = nil
    let tableView = UITableView()
    var clocks: [Clock] = []
    let factory = ClockViewFactory()
    var selectedClock: Clock? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        clocks = factory.makeClocks()
        setupTableView()
        tableView.reloadData()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        tableView.rowHeight = 60
        let nib = UINib(nibName: "ClockPreviewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ChooseClockViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let previewCell = cell as? ClockPreviewCell {
            previewCell.model = clocks[indexPath.row]
        }
//        if  clocks[indexPath.row] == selectedClock {
//             cell.backgroundColor = .gray
//         } else {
//             cell.backgroundColor = .white
//         }
        return cell
    }
}

extension ChooseClockViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let model = clocks[indexPath.row]

        delegate?.didSelect(clock: model)
    }
}
