//
//  ClockViewFactory.swift
//  SimpleClock2
//
//  Created by Victor on 29.11.2023.
//

import Foundation
import UIKit

class ClockViewFactory {
    enum Preview: String {
        case label = "LabelClockView"
        case yelowLabel = "LabelClockView yellow"
        case colorLabel = "ColorLabelClockView"
        case greenBlueLabel = "ColorLabelClockView green blue"
        case verticalLabel = "VerticalLabelClockView"
        case cloudLabel = "LabelClockViewCloud"
    }
    
    func makePreviews() -> [Preview] {
        return [.label, .colorLabel, .verticalLabel, .greenBlueLabel, .yelowLabel, .cloudLabel]
    }
    
    func make(preview: Preview) -> UIView & ClockViewProtocol {
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
        }
    }
}
