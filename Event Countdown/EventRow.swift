//
//  EventRow.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 11/11/24.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    let formatter = RelativeDateTimeFormatter()

    
    var body: some View {
        HStack {
            VStack {
                Text(event.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(event.textColor)
                Text(formatter.localizedString(for: event.date, relativeTo: .now))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
        }
        
    }
}

#Preview {
    EventRow(event: .init(id: UUID(), title: "Halloween", date: .now, textColor: .red))
}
