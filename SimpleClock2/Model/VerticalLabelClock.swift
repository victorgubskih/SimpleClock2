import Foundation
import UIKit

struct VerticalLabelClock: Clock {
    let timeZone: TimeZone
    let  textColor: UIColor
    let backgroundColor: UIColor

    var wrappedValue: CodableClockWrapper { return .verticalLabel(self) }
}

