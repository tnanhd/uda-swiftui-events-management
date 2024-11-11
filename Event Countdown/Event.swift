//
//  Event.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 10/11/24.
//

import Foundation
import SwiftUICore

struct Event: Comparable, Identifiable {
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.title < rhs.title
    }
    
    var id: UUID
    let title: String
    let date: Date
    let textColor: Color
}

extension Event {
    static var all: [Event] {
        [
            .init(id: UUID(), title: "Event 1", date: .now.addingTimeInterval(-15000), textColor: .red),
            .init(id: UUID(), title: "Event 2", date: .now.addingTimeInterval(15000), textColor: .blue)
        ]
    }
}
