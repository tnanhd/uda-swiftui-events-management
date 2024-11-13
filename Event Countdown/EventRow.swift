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
    @State private var timer: Timer?
    
    var body: some View {
        HStack {
            VStack {
                Text(event.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(event.textColor)
                Text(timeRemaining)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onAppear(perform: startTimer)
                    .onDisappear(perform: stopTimer)
            }
            Spacer()
        }
    }
    
    private var timeRemaining: String {
        let remainingTime = event.date.timeIntervalSince(currentDate)
        return remainingTime > 0
        ? formatter.localizedString(for: event.date, relativeTo: currentDate)
        : "Event has started"
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { _ in
            currentDate = .now
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    EventRow(event: .init(id: UUID(), title: "Halloween", date: .now, textColor: .red))
}
