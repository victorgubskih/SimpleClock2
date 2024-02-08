//
//  TimeZoneController.swift
//  SimpleClock2
//
//  Created by Victor on 10.10.2023.
//

import UIKit

import Foundation

//protocol SelectTimeZoneDelegate  {
//    func didSelect(timeZone: TimeZone)
//}

class TimeZoneController: UIViewController {
    
   // var delegate: SelectTimeZoneDelegate? = nil
    let action: (TimeZone) -> ()
    private let tableView = UITableView()
    private var safeArea: UILayoutGuide!
    private var timeZones: [String: TimeZone] = ["Los Angeles": TimeZone(identifier: "UTC-7")!, "Local": TimeZone.current]
    var selectedTimeZone: TimeZone?
    
    var searchControler: UISearchController!
    var searchResult: [String: TimeZone] = [:]
    
    static let userKey = "selectedTimeZone"
   
    var isSearchActive: Bool {
        return !(searchControler.searchBar.text ?? "").isEmpty
    }
   
    init(action: @escaping (TimeZone) -> ()) {
        self.action = action
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchControler = UISearchController(searchResultsController: nil)
        searchControler.searchResultsUpdater = self
        tableView.tableHeaderView = searchControler.searchBar
        
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
    
    
    
    func filterContent(searchText: String) {
        searchResult = timeZones.filter({(key_name, value_timeZone) -> Bool in
            return key_name.contains(searchText) || value_timeZone == self.selectedTimeZone
        })
    }
}

extension TimeZoneController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? searchResult.count : timeZones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let timeZones = isSearchActive ? searchResult : self.timeZones
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
        if searchControler.isActive {
            searchControler.dismiss(animated: false)
        }
        dismiss(animated: true, completion: nil)
        let timeZones = isSearchActive ? searchResult : self.timeZones
        let cityName = timeZones.keys.sorted()[indexPath.row]
        if let selectedTimeZone = timeZones[cityName] {
            //delegate?.didSelect(timeZone: timeZone)
            action(selectedTimeZone)
            UserDefaults.standard.set(selectedTimeZone.identifier, forKey: TimeZoneController.userKey)
        }
        
    }
}

extension TimeZoneController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
           filterContent(searchText: searchText)
        }
        tableView.reloadData()
    }
}
