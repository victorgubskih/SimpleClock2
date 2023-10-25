//
//  SelectColorControler.swift
//  SimpleClock2
//
//  Created by Victor on 20.10.2023.
//

import UIKit

protocol UpdateColorDelegateProtocol: AnyObject {
    func buttonTapedAt(color: UIColor)
}

class SelectColorControler: UIViewController {
    private let tableView = UITableView()
    var delegate: UpdateColorDelegateProtocol? = nil
    private var colors: [(String, UIColor)] = [("Red", UIColor.red), ("Green", UIColor.green), ("Blue", UIColor.blue)]
    

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

extension SelectColorControler: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (colors[indexPath.row]).0
        return cell
    }
    
 
}

extension SelectColorControler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let color = colors[indexPath.row].1
        delegate?.buttonTapedAt(color: color)
        
    }
}
