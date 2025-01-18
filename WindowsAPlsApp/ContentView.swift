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
        
        Button("Xcode Like Window") {
            openWindow(id: "AlertWindow")
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

struct AlertWindows: View {
    
    @State private var showAlert: Bool = false
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.ultraThinMaterial)
                
            VStack(spacing: 10) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundStyle(.primary.secondary)
                
                Text("Saved Successfully")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
        }
        .frame(width: 200, height: 200)
        .opacity(showAlert ? 1 : 0)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.25)) {
                showAlert = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 0.25), completionCriteria: .logicallyComplete) {
                    showAlert = false
                } completion: {
                    dismissWindow()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
