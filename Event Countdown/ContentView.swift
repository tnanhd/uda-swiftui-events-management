//
//  ContentView.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var events: [Event] = []
    
    var body: some View {
        List(events.indices, id: \.self) { index in
            EventRow(event: events[index])
                .swipeActions {
                    Button("Delete"){
                        events.remove(at: index)
                    }
                    .tint(.red)
                }
        }
    }
}

#Preview {
    ContentView(events: Event.all)
}
