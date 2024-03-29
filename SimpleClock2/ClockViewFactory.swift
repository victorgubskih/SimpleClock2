//
//  ClockViewFactory.swift
//  SimpleClock2
//
//  Created by Victor on 29.11.2023.
//

import Foundation
import UIKit

class ClockViewFactory {

    enum Preview: String, Codable {
        case label = "LabelClockView"
        case yelowLabel = "LabelClockView yellow"
        case colorLabel = "ColorLabelClockView"
        case greenBlueLabel = "ColorLabelClockView green blue"
        case verticalLabel = "VerticalLabelClockView"
        case cloudLabel = "LabelClockViewCloud"
        case justClockView = "JustClockView"
    }

    func makePreviews() -> [Preview] {
        return [.label, .colorLabel, .verticalLabel, .greenBlueLabel, .yelowLabel, .cloudLabel, .justClockView]
    }
    
    func makeClockView(with preview: Preview) -> UIView & ClockViewProtocol {
        switch preview {
        case .label:
            return LabelClockView()
        case .colorLabel:
            return  ColorLabelClockView()
        case .verticalLabel:
            return VerticalLabelClockView()
        case .greenBlueLabel:
            return ColorLabelClockView(startColor: .green, finishColor: .blue)
        case .yelowLabel:
            return LabelClockView(backgroundColor: .yellow) 
        case .cloudLabel:
            return CloudClockView()
        case.justClockView:
            return JustClockView()
        }
    }
}
