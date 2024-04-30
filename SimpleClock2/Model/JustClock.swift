import Foundation
import UIKit

struct JustClock: Clock {
    var timeZone: TimeZone
    var background: UIColor

    var wrappedValue: CodableClockWrapper { return .justClock(self) }
}

