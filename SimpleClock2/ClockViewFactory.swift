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

    func makeClocks() -> [Clock] {
        return [
            LabelClock(timeZone: .current, textColor: .black, backgroundColor: .white),
            VerticalLabelClock(timeZone: .current, textColor: .black, backgroundColor: .brown),
            ColorLabelClock(timeZone: .current, textColor: .yellow, srartColor: .white, finishColor: .red),
            CloudLabelClock(timeZone: .current, textColor: .black),
            JustClock(timeZone: .current, background: .green)
        ]
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

    func makeClockView(with clock: Clock) -> UIView & ClockViewProtocol {
        switch clock {
        case let labelClock as LabelClock:
            let view = LabelClockView()
            view.config(with: labelClock)
            return view
        case let colorLabel as ColorLabelClock:
            let view = ColorLabelClockView()
            view.config(with: colorLabel)
            return view
        case let verticalLabel as VerticalLabelClock:
            let view = VerticalLabelClockView()
            view.config(with: verticalLabel)
            return view
        case let cloudLabel as CloudLabelClock:
            let view = CloudClockView()
            view.config(with: cloudLabel)
            return view
        case let justClockView as JustClock:
            let view = JustClockView()
            view.config(with: justClockView)
            return view
        default:
            return LabelClockView()
        }
    }
}
