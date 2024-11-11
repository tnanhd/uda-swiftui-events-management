//
//  Event_CountdownApp.swift
//  Event Countdown
//
//  Created by Tran Nhat Anh on 10/11/24.
//

import SwiftUI

@main
struct Event_CountdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(events: Event.all)
        }
    }
}
