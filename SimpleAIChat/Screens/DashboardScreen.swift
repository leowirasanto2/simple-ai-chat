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
    
    @State var exploreData = [
        SquaredCardModel(title: "Programming", description: "Help your programming skills by using AI generated solutions", image: Image(systemName: "keyboard")),
        SquaredCardModel(title: "Crypto", description: "AI generated cryptocurrency analysis with trained data", image: Image(systemName: "bitcoinsign.circle")),
        SquaredCardModel(title: "Trade", description: "AI writing trading tips and trick by using trained data analysis", image: Image(systemName: "chart.xyaxis.line"))
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
            
            GroupedSquaredCardView(items: $exploreData)
        }
    }
}

#Preview {
    DashboardScreen()
}
