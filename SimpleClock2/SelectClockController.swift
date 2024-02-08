//
//  SelectClockController.swift
//  SimpleClock2
//
//  Created by Victor on 23.11.2023.
//

import UIKit
protocol SelectClockDelegate  {
    func didSelect(clock: UIView & ClockViewProtocol, preview: ClockViewFactory.Preview)
}

class SelectClockController: UIViewController {

    var delegate: SelectClockDelegate? = nil
    let tableView = UITableView()
    var previews: [ClockViewFactory.Preview] = []
    let factory = ClockViewFactory()
    var selectedClock: ClockViewFactory.Preview? = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        previews = factory.makePreviews()
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


extension SelectClockController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let previewCell = cell as? ClockPreviewCell {
            previewCell.preview = previews[indexPath.row]
        }
        
        if  previews[indexPath.row] == selectedClock {
             cell.backgroundColor = .gray
         } else {
             cell.backgroundColor = .white
         }
        
        return cell
    }
        
}

extension SelectClockController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        let preview = previews[indexPath.row]
        UserDefaults.standard.set(preview.rawValue, forKey: ClockViewFactory.Preview.key)
        let currentClock = factory.makeClockView(with: preview)
        delegate?.didSelect(clock: currentClock, preview: preview)
        
    }
}

