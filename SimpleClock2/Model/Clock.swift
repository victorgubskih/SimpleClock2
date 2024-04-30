import Foundation
import UIKit

protocol Clock: Codable {
    var timeZone: TimeZone { get }
    var wrappedValue: CodableClockWrapper { get }
}

enum CodableClockWrapper: Codable {
    case label(LabelClock)
    case verticalLabel(VerticalLabelClock)
    case colorLabel(ColorLabelClock)
    case cloudLabel(CloudLabelClock)
    case justClock(JustClock)

    var rawValue: Clock {
        switch self {
        case .label(let clock):
            return clock
        case .verticalLabel(let clock):
            return clock
        case .colorLabel(let clock):
            return clock
        case .cloudLabel(let clock):
            return clock
        case .justClock(let clock):
            return clock
        }
    }
}
