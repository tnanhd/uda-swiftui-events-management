//
//  ContentView.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 10/11/24.
//

import SwiftUI

struct EventsView: View {
    @State var events: [Event] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(events) { event in
                    NavigationLink(value: event) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        EventForm(event: Event(), operationMode: .create) { newEvent in
                            events.append(newEvent)
                            events.sort()
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: Event.self) {
                event in
                EventForm(event: event, operationMode: .edit) { editEvent in
                    for (index, event) in events.enumerated() where event.id == editEvent.id {
                        events[index] = editEvent
                    }
                    events.sort()
                }
            }
            .navigationTitle("Events")
            .overlay(
                Group {
                    if (events.isEmpty) {
                        ContentUnavailableView {
                            Label("No Event", systemImage: "tray.fill")
                        } description: {
                            Text("Events will appear here.")
                        }
                    }
                }
            )
        }
    }
    
    private func delete(at offset: IndexSet) {
        events.remove(atOffsets: offset)
    }
}

#Preview {
    EventsView(events: [Event(id: UUID(), title: "Hello world", date: .now, textColor: .red)])
}
