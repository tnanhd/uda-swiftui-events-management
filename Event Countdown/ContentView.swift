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
        NavigationStack {
            List(events.indices, id: \.self) { index in
                let event = events[index]
                NavigationLink {
                    EventForm(event: event) { editedEvent in
                        events[index] = editedEvent
                    }
                } label: {
                    EventRow(event: event).swipeActions {
                        Button("Delete"){
                            events.remove(at: index)
                        }
                        .tint(.red)
                    }
                }
                
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        EventForm(event: Event()) { newEvent in
                            events.append(newEvent)
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .overlay(Group {
                if events.isEmpty {
                    NavigationLink {
                        EventForm(event: Event()) { newEvent in
                            events.append(newEvent)
                        }
                    } label: {
                        Text("Click here to add your first event!")
                            .font(.headline)
                    }
                }
            })
        }
    }
}

#Preview {
    ContentView(events: [])
}
