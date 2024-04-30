import Foundation
import UIKit

struct CloudLabelClock: Clock {
    var timeZone: TimeZone
    var textColor: UIColor

    var wrappedValue: CodableClockWrapper { return .cloudLabel(self) }
}
