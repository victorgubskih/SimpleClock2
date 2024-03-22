import Foundation
import UIKit

protocol Clock: Codable {
    var timeZone: TimeZone { get }
}

