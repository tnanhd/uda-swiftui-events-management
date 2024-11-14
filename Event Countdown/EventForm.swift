//
//  EventDetail.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 12/11/24.
//

import SwiftUI

enum OperationMode: String {
    case create
    case edit
}

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @State var event: Event
    let operationMode: OperationMode
    
    var onSave: (_ event: Event) -> Void = { _ in }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $event.title, prompt: Text("Title"))
                    .foregroundStyle(event.textColor)
                DatePicker("Date", selection: $event.date, displayedComponents: [.date, .hourAndMinute])
                ColorPicker("Text Color", selection: $event.textColor)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Save", systemImage: "checkmark") {
                    onSave(event)
                    dismiss()
                }
                .disabled(event.title.isEmpty)
            }
        }
        .navigationTitle(operationMode == .create ? "Create Event" : "Edit \(event.title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EventForm(event: Event(), operationMode: .create)
}
