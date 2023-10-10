//
//  TimeZoneController.swift
//  SimpleClock2
//
//  Created by Victor on 10.10.2023.
//

import UIKit

import Foundation

class TimeZoneController: UIViewController {
    var localButton = UIButton(type: .roundedRect)
    var losAgelesButton = UIButton(type: .roundedRect)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(localButton)
        localButton.setTitle("Local", for: .normal)
        localButton.setTitleColor(.red, for: .normal)
        localButton.addTarget(self, action: #selector(localAction(sender:)), for: .touchUpInside)
        localButton.backgroundColor = .gray
        localButton.layer.cornerRadius = 10
        localButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            localButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            localButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93),
            localButton.widthAnchor.constraint(equalToConstant: 110),
            localButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        view.addSubview(losAgelesButton)
        losAgelesButton.setTitle("Los Angeles", for: .normal)
        losAgelesButton.setTitleColor(.green, for: .normal)
        losAgelesButton.addTarget(self, action: #selector(losAngelesAction(sender:)), for: .touchUpInside)
        losAgelesButton.backgroundColor = .gray
        losAgelesButton.layer.cornerRadius = 10
        losAgelesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            losAgelesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            losAgelesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93),
            losAgelesButton.widthAnchor.constraint(equalToConstant: 110),
            losAgelesButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }

    @objc func localAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func losAngelesAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
