//
//  SelectColorControler.swift
//  SimpleClock2
//
//  Created by Victor on 20.10.2023.
//

import UIKit

protocol SelectColorDelegate: AnyObject {
    func didSelect(color: UIColor)
}

enum SelectColorItem: Codable {
    case color(UIColor)
    case addNew(String)
}

class SelectColorControler: UIViewController {
    private let tableView = UITableView()
    var delegate: SelectColorDelegate?
    private var items: [SelectColorItem] = [
        .color(UIColor.red),
        .color(UIColor.green),
        .color(UIColor.blue),
        .addNew("Add new color")
    ]
    var selectedColor: UIColor!
    let userKey = "selectItems"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        readItems()
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
    func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: userKey)
        }
    }
    func readItems() {
        guard let data = UserDefaults.standard.data(forKey: userKey) else {
            saveItems()
            return
        }
        self.items = (try? JSONDecoder().decode([SelectColorItem].self, from: data)) ?? []
    }
}

extension SelectColorControler: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        /*if indexPath.row < colors.count {
            cell.backgroundColor = (colors[indexPath.row])
        } else {
            cell.textLabel?.text = "add new color"
        }*/
        switch items[indexPath.row] {
        case .color(let c):
            cell.backgroundColor = c
            cell.textLabel?.text = nil
            if c == selectedColor {
                cell.accessoryType = .checkmark
             } else {
                 cell.accessoryType = .none
             }
        case .addNew(let t):
            cell.textLabel?.text = t
            cell.backgroundColor = .white
        }
        return cell
    }
}

extension SelectColorControler: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*if indexPath.row < colors.count {
            dismiss(animated: true, completion: nil)
            let color = colors[indexPath.row]
            delegate?.buttonTapedAt(color: color)
        }*/
        switch items[indexPath.row] {
        case .color(let c):
            dismiss(animated: true, completion: nil)
            delegate?.didSelect(color: c)
        case .addNew(_):
            let colorPickerVC = UIColorPickerViewController()
            colorPickerVC.delegate = self
            present(colorPickerVC, animated: true)
        }
    }
}
extension SelectColorControler : UIColorPickerViewControllerDelegate {

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        let insertIndex = (items.count - 1) < 0 ? 0 : (items.count - 1)
        items.insert(SelectColorItem.color(selectedColor), at: insertIndex )
        tableView.reloadData()
        saveItems()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, case SelectColorItem.color(_) = items[indexPath.row] {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveItems()
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        switch items[indexPath.row] {
        case .color(_):
            return true
        case .addNew(_):
            return false
        }
    }
}
