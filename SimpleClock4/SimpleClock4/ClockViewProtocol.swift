//
//  ClockViewProtocol.swift
//  SimpleClock4
//
//  Created by Victor on 17.02.2024.
//

import Foundation
import UIKit

 @objc protocol ClockViewProtocol {
    
     func updateTimeLabel()

    func update(timeZone: TimeZone)
    
    func update(color: UIColor)
    
    func currentTimeZone() -> TimeZone
}
