//
//  EventRow.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 11/11/24.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    private let formatter = RelativeDateTimeFormatter()
    
    @State private var currentDate: Date = .now
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            VStack {
                Text(event.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(event.textColor)
                Text(relativeTimeString)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onReceive(timer, perform: { _ in
                        currentDate = .now
                    })
            }
            Spacer()
        }
    }
    
    private var relativeTimeString: String {
        formatter.localizedString(for: event.date, relativeTo: currentDate)
    }
}

#Preview {
    EventRow(event: .init(id: UUID(), title: "Halloween", date: .now, textColor: .red))
}
