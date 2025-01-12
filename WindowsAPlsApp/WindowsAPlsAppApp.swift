//
//  WindowsAPlsAppApp.swift
//  WindowsAPlsApp
//
//  Created by Serhii Lukashchuk on 2025-01-12.
//

import SwiftUI

@main
struct WindowsAPlsAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "FloatingWindow") {
            FloatingWindow()
        }
        .windowLevel(.floating)
        .windowResizability(.contentSize)
    }
}
