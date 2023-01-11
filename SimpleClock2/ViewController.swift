//
//  ViewController.swift
//  SimpleClock2
//
//  Created by viktor on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var simpleClock: ClockView!
   
    var simpleClock1: ClockView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleClock = ClockView(speed:5)
        simpleClock.frame.size = CGSize(width: 200, height: 200) 
        simpleClock.center = CGPoint( x: view.center.x, y: simpleClock.frame.height )
        view.addSubview(simpleClock)
        simpleClock.theme = MonochromTime()
        simpleClock.setUp()
        simpleClock.startTimer()
        
        
        let button = UIButton(type: .custom)
        view.addSubview(button)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 10
       
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -135),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 100)
        ])
        button.setTitle("Choose", for: .normal)
        button.setTitleColor(.red, for: .normal)
       
        let action = UIAction { _ in
            let newScreen = ChooseCollorsViewController()
            newScreen.delegate = self
            self.present(newScreen, animated: true, completion: nil)
        }
        button.addAction(action, for: .touchUpInside)
        
    }

}

extension ViewController: ChooseCollorsDelegate {
    func setCollorsTheme(_ theme: ClockTheme) {
        
    }
    
    
}
