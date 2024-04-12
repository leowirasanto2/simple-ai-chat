//
//  DashboardScreen.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct DashboardScreen: View {
    @State var chatHistory = [
        "SwiftUI Tutorial",
        "Crypto trading tips",
        "What's crypto?",
        "Web3 app ideas"
    ]
    @State var selectedText: String = ""
    
    var body: some View {
        ScrollView {
            newChatBtn
            chatHistorySection
            exploreMoreView
        }
        .frame(maxWidth: .infinity)
        .background(.linearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom))
    }
    
    private var newChatBtn: some View {
        Button {
            
        } label: {
            HStack {
                Spacer()
                Text("New Chat")
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: .infinity))
        .padding()
    }
    
    private var chatHistorySection: some View {
        VStack {
            SectionTitleView(title: "Chat History") {
                //TODO: - go to chat view
            }
            .padding()
            
            GroupedChipTextView(texts: $chatHistory) { selected in
                selectedText = selected
            }
        }
    }
    
    private var exploreMoreView: some View {
        VStack {
            SectionTitleView(title: "Explore More") {
                //TODO: - go to topics
            }
            .padding()
        }
    }
}

#Preview {
    DashboardScreen()
}
