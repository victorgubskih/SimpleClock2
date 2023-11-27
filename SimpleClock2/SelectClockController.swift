//
//  SelectClockController.swift
//  SimpleClock2
//
//  Created by Victor on 23.11.2023.
//

import UIKit
protocol SelectClockDelegate  {
    func didSelect(clock: UIView & ClockViewProtocol)
}

class SelectClockController: UIViewController {

    var delegate: SelectClockDelegate? = nil
    let tableView = UITableView()
    var clocks: [String] = ["LabelClockView", "ColorLabelClockView", "VerticalLabelClockView"]

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
   
}


extension SelectClockController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = clocks[indexPath.row]
        return cell
    }
        
}

extension SelectClockController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let clockName = clocks[indexPath.row]
        if clockName == "LabelClockView" {
            let currentClock = LabelClockView()
            delegate?.didSelect(clock: currentClock)
        }
        if clockName == "ColorLabelClockView" {
            let currentClock = ColorLabelClockView()
            delegate?.didSelect(clock: currentClock)
        }
        if clockName == "VerticalLabelClockView" {
            let currentClock = VerticalLabelClockView()
            delegate?.didSelect(clock: currentClock)
        }
    }
}

