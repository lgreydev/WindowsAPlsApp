//
//  ContentView.swift
//  WindowsAPlsApp
//
//  Created by Serhii Lukashchuk on 2025-01-12.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        Button("Show Floating Window") {
            openWindow(id: "FloatingWindow")
        }
    }
}

struct FloatingWindow: View {
    
    @State private var isHovering: Bool = false
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        Image(.pic)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .overlay(content: {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay(content: {
                        Button {
                            dismissWindow()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    })
                    .opacity(isHovering ? 1 : 0)
                    .animation(.snappy, value: isHovering)
            })
            .onHover {
                isHovering = $0
            }
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    ContentView()
}
