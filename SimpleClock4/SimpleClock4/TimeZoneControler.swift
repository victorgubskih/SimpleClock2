//
//  TimeZoneControler.swift
//  SimpleClock4
//
//  Created by Victor on 11.02.2024.
//

import UIKit

protocol SelectTimeZoneDelegate {
    func didSelect(timeZone:TimeZone)
}

class TimeZoneControler: UIViewController {
    
    var delegate: SelectTimeZoneDelegate? = nil
     private var tableView = UITableView()
    private var timeZones: [String: TimeZone] = ["Local": TimeZone.current, "Los Angeles": TimeZone(identifier: "UTC-7")!]
    var selectedTimeZone: TimeZone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        var timezoneidentifiers = TimeZone.knownTimeZoneIdentifiers
        timeZones = timezoneidentifiers.reduce(into:[String: TimeZone]()) {partialResult,identifier in
            partialResult[identifier] = TimeZone(identifier: identifier)!}
        
        tableView.reloadData()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TimeZoneControler: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeZones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key = timeZones.keys.sorted()[indexPath.row]
        cell.textLabel?.text = key
        if TimeZone.current == timeZones[key] {
            cell.textLabel?.text =  key + "- current"
        }
        if timeZones[key] == selectedTimeZone {
            cell.backgroundColor = .yellow
        } else {
            cell.backgroundColor = .white
        }
        if  timeZones[key] == selectedTimeZone {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension TimeZoneControler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let cityName = timeZones.keys.sorted()[indexPath.row]
        if let timeZone = timeZones[cityName] {
            delegate?.didSelect(timeZone: timeZone)
        }
    }
}
