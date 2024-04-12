//
//  ContentView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var path: [PathRoute] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            DashboardScreen(path: $path)
        }
    }
}

#Preview {
    ContentView()
}
