//
//  ContentView.swift
//  WindowsAPlsApp
//
//  Created by Serhii Lukashchuk on 2025-01-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.pic)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    ContentView()
}
