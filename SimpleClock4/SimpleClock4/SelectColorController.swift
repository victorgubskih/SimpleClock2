//
//  SelectVolorController.swift
//  SimpleClock4
//
//  Created by Victor on 13.02.2024.
//

import UIKit
protocol SelectColorDelegate: AnyObject {
    func didSelect(color: UIColor)
}

enum SelectColorItem: Codable {
    case color(UIColor)
    case addNew(String)
}

class SelectColorController: UIViewController {
    
    var delegate: SelectColorDelegate? = nil
    var tableView = UITableView()
    private var items: [SelectColorItem] = [
        .color(UIColor.red),
        .color(UIColor.blue),
        .color(UIColor.green),
        .addNew("add new color")
    ]
    
    let userKey = "selectItems"

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = .white
        setupTableView()
        readitems()
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

    func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: userKey)
        }
       
    }
    
    func readitems() {
        guard let data = UserDefaults.standard.data(forKey: userKey) else {
            saveItems()
            return
        }
        self.items = (try? JSONDecoder().decode([SelectColorItem].self, from: data)) ?? []
    }
   

}

extension SelectColorController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        if indexPath.row < colors.count {
//            cell.backgroundColor = colors[indexPath.row]
//        } else {
//            cell.textLabel?.text = "add new color"
//        }
        switch items[indexPath.row] {
        case .color(let c):
            cell.backgroundColor = c
            cell.textLabel?.text = nil
        case .addNew(let t):
            cell.textLabel?.text = t
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    
}

extension SelectColorController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        switch items[indexPath.row] {
        case .color(let c):
            dismiss(animated: true, completion: nil)
            
            self.delegate?.didSelect(color: c)
        case .addNew(_):
            let colorPickerVC = UIColorPickerViewController()
            colorPickerVC.delegate = self
            present(colorPickerVC, animated: true)
        }
    }
}
extension SelectColorController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        //items.append(.color(selectedColor))
        let insertIndex = items.isEmpty ? 0 : items.count - 1
        items.insert(SelectColorItem.color(selectedColor), at: insertIndex)
        tableView.reloadData()
        saveItems()
    }

    func tempSort() {
        items.sort { item1, item2 in
            switch (item1, item2) {
            case (.color, .color):
                return false
            case (.addNew, .color):
                return false
            case (.addNew, .addNew):
                return false
            case (.color, .addNew):
                return true
            }
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, case SelectColorItem.color(_) = items[indexPath.row] {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveItems()
        }

    }




}
























//let insertIndex = (items.count - 1) < 0 ? 0 : (items.count - 1)
//items.insert(SelectColorItem.color(selectedColor), at: insertIndex)

//func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath  ) {
//    if editingStyle == .delete, case SelectColorItem.color(_) = items[indexPath.row] {
//        items.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .fade)
//        saveItems()
//    }
//}
