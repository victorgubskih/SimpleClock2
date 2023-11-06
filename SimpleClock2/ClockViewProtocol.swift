//
//  ClockViewForObjets.swift
//  SimpleClock2
//
//  Created by Victor on 06.11.2023.
//

import Foundation
import UIKit

@objc protocol ClockViewProtocol {
   
    func updateTimeLabel()
    
    func upgate(timeZone: TimeZone)
    
    func update(color: UIColor)
    
    func currentTimeZone() -> TimeZone
}
