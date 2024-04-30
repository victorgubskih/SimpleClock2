import Foundation
import UIKit

struct ColorLabelClock: Clock {
    let timeZone: TimeZone
    let  textColor: UIColor
    var  srartColor: UIColor
    var finishColor: UIColor

    var wrappedValue: CodableClockWrapper { return .colorLabel(self) }
}
