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
        lhs.date < rhs.date
    }
    
    var id: UUID
    var title: String
    var date: Date
    var textColor: Color
    
    init(id: UUID, title: String, date: Date, textColor: Color) {
        self.id = id
        self.title = title
        self.date = date
        self.textColor = textColor
    }
    
    init() {
        self.id = UUID()
        self.title = ""
        self.date = .now
        self.textColor = .blue
    }
}
