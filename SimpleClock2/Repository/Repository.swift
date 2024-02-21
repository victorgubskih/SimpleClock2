import Foundation
import UIKit

protocol Repository {
    func save(preview: ClockViewFactory.Preview)
    func save(color: UIColor)
    func save(timeZone: TimeZone)

    func preview() -> ClockViewFactory.Preview?
    func color() -> UIColor?
    func timeZone() -> TimeZone?
}
