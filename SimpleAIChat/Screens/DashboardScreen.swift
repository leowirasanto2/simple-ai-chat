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
    @State var promptLib = [
        "Crypto", "Web3", "SwiftUI", "Programming", "Trading", "Scalping", "Swing Trade", "Design", "Email", "Sales", "Mobile App", "Figma"
    ]
    @State var exploreData = [
        SquaredCardModel(title: "Programming", description: "Help your programming skills by using AI generated solutions", image: Image(systemName: "keyboard")),
        SquaredCardModel(title: "Crypto", description: "AI generated cryptocurrency analysis with trained data", image: Image(systemName: "bitcoinsign.circle")),
        SquaredCardModel(title: "Trade", description: "AI writing trading tips and trick by using trained data analysis", image: Image(systemName: "chart.xyaxis.line"))
    ]
    
    @Binding var path: [PathRoute]
    
    var body: some View {
        ScrollView {
            newChatBtn
            chatHistorySection
            exploreMoreView
            promptLibrary
        }
        .frame(maxWidth: .infinity)
        .background(.linearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom))
        .navigationDestination(for: PathRoute.self) { destination in
            switch destination {
            case .chatScreen:
                ChatScreen()
            case .chatScreenWithTopic(let topic):
                Text("chat screen - \(topic)")
            case .exploreScreen:
                Text("explore Screen")
            case .historyScreen:
                Text("history Screen")
            }
        }
    }
    
    private var newChatBtn: some View {
        Button {
            path = [.chatScreen]
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
                path = [.historyScreen]
            }
            .padding()
            
            GroupedChipTextView(texts: $chatHistory) { selected in
                path = [.chatScreenWithTopic(topic: selected)]
            }
        }
    }
    
    private var exploreMoreView: some View {
        VStack {
            SectionTitleView(title: "Explore More") {
                path = [.exploreScreen]
            }
            .padding()
            
            GroupedSquaredCardView(items: $exploreData) { model in
                path = [.chatScreenWithTopic(topic: model.title)]
            }
        }
    }
    
    private var promptLibrary: some View {
        VStack {
            SectionTitleView(title: "Prompt library") {}
            .padding()
            
            MultiRowGroupedChipView(items: $promptLib, maxItemPerRow: 4) { selected in
                path = [.chatScreenWithTopic(topic: selected)]
            }
        }
    }
}

#Preview {
    DashboardScreen(path: .constant([]))
}
