//
//  ViewController.swift
//  SimpleClock2
//
//  Created by viktor on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sipleclock2: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sipleclock2.translatesAutoresizingMaskIntoConstraints = false
        
        sipleclock2.center = view.center
        sipleclock2.layer.borderWidth = 2
        sipleclock2.layer.borderColor = UIColor.black.cgColor
        
        sipleclock2.layer.cornerRadius = sipleclock2.frame.height / 2
    }


}

