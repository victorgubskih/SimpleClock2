//
//  TimeZoneController.swift
//  SimpleClock2
//
//  Created by Victor on 10.10.2023.
//

import UIKit

import Foundation

protocol UpdateTimeZoneDelegateProtocol  {
    func upgateTimeViewControler(timeZone: TimeZone)
}

class TimeZoneController: UIViewController  {
    
    var delegate: UpdateTimeZoneDelegateProtocol? = nil
    private let tableView = UITableView()
    private var safeArea: UILayoutGuide!
    private var timeZones: [String: TimeZone] = ["Los Angeles": TimeZone(identifier: "UTC-7")!, "Local": TimeZone.current]
    var selectedTimeZone: TimeZone?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
        let timeZoneIdentifier = TimeZone.knownTimeZoneIdentifiers
        timeZones = timeZoneIdentifier.reduce(into: [String: TimeZone]()) { particulaResult, identifier in
            particulaResult[identifier] = TimeZone(identifier: identifier)!
        }
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

extension TimeZoneController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeZones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key = timeZones.keys.sorted()[indexPath.row]
        cell.textLabel?.text = key
        if TimeZone.current == timeZones[key] {
            cell.textLabel?.text = key + "- Current "
        }
       if timeZones[key] == selectedTimeZone {
            cell.backgroundColor = .gray
        } else {
            cell.backgroundColor = .white
        }
        if timeZones[key] == selectedTimeZone {
            cell.accessoryType = .checkmark
         } else {
             cell.accessoryType = .none
         }
        return cell
    }
}

extension TimeZoneController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let cityName = timeZones.keys.sorted()[indexPath.row]
        if let timeZone = timeZones[cityName] {
            delegate?.upgateTimeViewControler(timeZone: timeZone)
        }
    }
}
