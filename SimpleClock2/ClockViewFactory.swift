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
        case colorLabel = "ColorLabelClockView"
        case greenBlueLabel = "ColorLabelClockView green blue"
        case verticalLabel = "VerticalLabelClockView"
    }
    
    func makePreviews() -> [Preview] {
        return [.label, .colorLabel, .verticalLabel, .greenBlueLabel]
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
        }
    }
}
