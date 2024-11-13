//
//  EventDetail.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 12/11/24.
//

import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @State var event: Event
    @State var isInvalid: Bool = false
    
    var onSave: (_ event: Event) -> Void = { _ in }
    
    var body: some View {
        NavigationStack {
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
                    Button {
                        if (!validateTitle()) {
                            onSave(event)
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .alert("Title can not be empty", isPresented: $isInvalid) {
                        Button("OK", role: .cancel) { }
                    }
                }
            }
        }
    }
    
    func validateTitle() -> Bool {
        isInvalid = event.title.isEmpty
        return isInvalid
    }
}

#Preview {
    EventForm(event: Event())
}
