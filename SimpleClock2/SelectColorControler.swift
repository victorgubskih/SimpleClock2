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

enum SelectColorItem {
    case color(UIColor)
    case addNew(String)
}

class SelectColorControler: UIViewController {
    private let tableView = UITableView()
    var delegate: UpdateColorDelegateProtocol? = nil
    private var items: [SelectColorItem] = [
        .color(UIColor.red),
        .color(UIColor.green),
        .color(UIColor.blue),
        .addNew("Add new color")
    ]
    

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
            delegate?.buttonTapedAt(color: c)
        case .addNew(let t):
            let colorPickerVC = UIColorPickerViewController()
            colorPickerVC.delegate = self
            present(colorPickerVC, animated: true)
        }
    }
}
extension SelectColorControler : UIColorPickerViewControllerDelegate {

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        items.append(SelectColorItem.color(selectedColor))
        tableView.reloadData()
    }
    
    

}
