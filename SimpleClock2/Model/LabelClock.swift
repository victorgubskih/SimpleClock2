import Foundation
import UIKit

struct LabelClock: Clock {
    let timeZone: TimeZone
    let textColor: UIColor
    let backgroundColor: UIColor

    var wrappedValue: CodableClockWrapper { return .label(self) }
}
