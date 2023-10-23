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
    
    var delegate: UpdateColorDelegateProtocol? = nil
    var buttonColorRed = UIButton(type: .roundedRect)
    var buttonColorBlue = UIButton(type: .roundedRect)
    var buttonColorGreen = UIButton(type: .roundedRect)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(buttonColorRed)
        buttonColorRed.setTitle("Red", for: .normal)
        buttonColorRed.setTitleColor(.red, for: .normal)
        buttonColorRed.addTarget(self, action: #selector(redButtonAction(sender:)), for: .touchUpInside)
        buttonColorRed.backgroundColor = .gray
        buttonColorRed.layer.cornerRadius = 10
        buttonColorRed.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonColorRed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            buttonColorRed.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonColorRed.widthAnchor.constraint(equalToConstant: 100),
            buttonColorRed.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(buttonColorBlue)
        buttonColorBlue.setTitle("Blue", for: .normal)
        buttonColorBlue.setTitleColor(.blue, for: .normal)
        buttonColorBlue.addTarget(self, action: #selector(blueButtonAction(sender:)), for: .touchUpInside)
        buttonColorBlue.backgroundColor = .gray
        buttonColorBlue.layer.cornerRadius = 10
        buttonColorBlue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonColorBlue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            buttonColorBlue.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonColorBlue.widthAnchor.constraint(equalToConstant: 100),
            buttonColorBlue.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(buttonColorGreen)
        buttonColorGreen.setTitle("Green", for: .normal)
        buttonColorGreen.setTitleColor(.green, for: .normal)
        buttonColorGreen.addTarget(self, action: #selector(greenButtonAction(sender:)), for: .touchUpInside)
        buttonColorGreen.backgroundColor = .gray
        buttonColorGreen.layer.cornerRadius = 10
        buttonColorGreen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonColorGreen.trailingAnchor.constraint(equalTo: buttonColorRed.leadingAnchor, constant: -40),
            buttonColorGreen.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonColorGreen.widthAnchor.constraint(equalToConstant: 100),
            buttonColorGreen.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


    @objc func redButtonAction(sender: UIButton) {
        self.delegate?.buttonTapedAt(color: .red)
        dismiss(animated: true, completion: nil)
    }
    @objc func blueButtonAction(sender: UIButton) {
        self.delegate?.buttonTapedAt(color: .blue)
        dismiss(animated: true, completion: nil)
    }
    @objc func greenButtonAction(sender: UIButton) {
        self.delegate?.buttonTapedAt(color: .green)
        dismiss(animated: true, completion: nil)
    }
}
