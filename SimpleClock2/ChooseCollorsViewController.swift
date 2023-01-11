//
//  ChooseCollorsViewController.swift
//  SimpleClock2
//
//  Created by viktor on 10.01.2023.
//

import UIKit

protocol ChooseCollorsDelegate {
    func setCollorsTheme(_ theme: ClockTheme) 
}

class ChooseCollorsViewController: UIViewController {
    
    var delegate: ChooseCollorsDelegate?
    
    
    var selectedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        
        
        
        let button1 = UIButton(type: .custom)
        view.addSubview(button1)
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.red.cgColor
        button1.layer.cornerRadius = 10
       
        button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            button1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -135),
            button1.widthAnchor.constraint(equalToConstant: 100),
            button1.heightAnchor.constraint(equalToConstant: 50)
        ])
        button1.setTitle("seconds", for: .normal)
        button1.setTitleColor(.red, for: .normal)
       
        let secondsAction = UIAction { _ in
            self.selectedButton = button1
            let chooseColorScreen = UIColorPickerViewController()
            chooseColorScreen.delegate = self
            self.present(chooseColorScreen, animated: true, completion: nil)
        }
        button1.addAction(secondsAction, for: .touchUpInside)
       
        let button2 = UIButton(type: .custom)
        view.addSubview(button2)
    
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.red.cgColor
        button2.layer.cornerRadius = 10
   
        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            button2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -135),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 50)
        ])
        button2.setTitle("minutes", for: .normal)
        button2.setTitleColor(.red, for: .normal)
        let minuteAction = UIAction { _ in
            self.selectedButton = button2
            let chooseColorScreen = UIColorPickerViewController()
            chooseColorScreen.delegate = self
            self.present(chooseColorScreen, animated: true, completion: nil)
        }
        button2.addAction(minuteAction, for: .touchUpInside)
       
        
        
        let button3 = UIButton(type: .custom)
        view.addSubview(button3)
    
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.red.cgColor
        button3.layer.cornerRadius = 10
   
        button3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            button3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            button3.widthAnchor.constraint(equalToConstant: 100),
            button3.heightAnchor.constraint(equalToConstant: 50)
        ])
       
        button3.setTitle("hours", for: .normal)
        button3.setTitleColor(.red, for: .normal)
        let hourAction = UIAction { _ in
            self.selectedButton = button3
            let chooseColorScreen = UIColorPickerViewController()
            chooseColorScreen.delegate = self
            self.present(chooseColorScreen, animated: true, completion: nil)
        }
        button3.addAction(hourAction, for: .touchUpInside)
        
        
        let button4 = UIButton(type: .custom)
        view.addSubview(button4)
    
        button4.layer.borderWidth = 1
        button4.layer.borderColor = UIColor.red.cgColor
        button4.layer.cornerRadius = 10
   
        button4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            button4.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            button4.widthAnchor.constraint(equalToConstant: 100),
            button4.heightAnchor.constraint(equalToConstant: 50)
        ])
        button4.setTitle("done", for: .normal)
        button4.setTitleColor(.red, for: .normal)
    }
}

extension ChooseCollorsViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        /*if selectedButton == secondButton {
            secondButton.setTitleColor(viewController.selectedColor, for: .normal)
        }
        if selectedButton == minuteButton {
            minuteButton.setTitleColor(viewController.selectedColor, for: .normal)
        }*/
        selectedButton?.setTitleColor(viewController.selectedColor, for: .normal)
    }
    
}
