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
                .simultaneousGesture(WindowDragGesture())
                .toolbarVisibility(.hidden, for: .windowToolbar)
                .containerBackground(.clear, for: .window)
        }
        .windowLevel(.floating)
        .windowResizability(.contentSize)
        .windowStyle(.plain)
        
        
        WindowGroup(id: "AlertWindow") {
            AlertWindows()
                .allowsHitTesting(false)
                .toolbarVisibility(.hidden, for: .windowToolbar)
                .containerBackground(.clear, for: .window)
        }
        .windowLevel(.floating)
        .windowBackgroundDragBehavior(.disabled)
        .windowResizability(.contentSize)
        .windowStyle(.plain)
        .restorationBehavior(.disabled)
        .defaultWindowPlacement { content, context in
            let viewSize = content.sizeThatFits(.init(context.defaultDisplay.visibleRect.size))
            return .init(.init(x: 0.5, y: 1), size: viewSize)
        }
    }
}
