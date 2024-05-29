//
//  DashboardScreen.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct DashboardScreen: View {
    @EnvironmentObject var contentModel: ContentModel
    @Binding var path: [PathRoute]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                if contentModel.dashboardContents?.data?.historyHighlight?.isEmpty == false {
                    chatHistorySection
                }
                if contentModel.dashboardContents?.data?.exploreDataHighlight?.isEmpty == false {
                    exploreMoreView
                }
                if contentModel.dashboardContents?.data?.promptLibrary?.isEmpty == false {
                    promptLibrary
                }
            }
        }
        .overlay {
            GeometryReader { geo in
                Button {
                    path = [.chatScreen]
                } label: {
                    HStack(alignment: .center) {
                        Text("Chat Now")
                            .fontWeight(.semibold)
                        Image(systemName: "quote.bubble.fill")
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: .infinity))
                }
                .frame(maxWidth: geo.size.width / 2)
                .position(x: geo.size.width / 2,y: geo.size.height - 32)
            }
        }
        .navigationDestination(for: PathRoute.self) { destination in
            switch destination {
            case .chatScreen:
                ChatScreen(path: $path)
                    .environmentObject(ChatModel())
            case .chatScreenWithTopic(let topic):
                ChatScreen(path: $path, topic: topic)
                    .environmentObject(ChatModel())
            case .exploreScreen:
                Text("explore Screen")
            case .historyScreen:
                Text("history Screen")
            }
        }
        .task {
            await contentModel.fetchContents()
        }
        .onAppear {
            contentModel.onAppear()
        }
        .onDisappear {
            contentModel.onDisappear()
        }
    }
    
    private var chatHistorySection: some View {
        SectionContainer(title: "Chat history") {
            path = [.historyScreen]
        } content: {
            if let texts = contentModel.dashboardContents?.data?.historyHighlight {
                GroupedChipTextView(texts: texts, bgColor: .black, fgColor: .white) { selected in
                    path = [.chatScreenWithTopic(topic: selected)]
                }
            }
        }
    }
    
    private var exploreMoreView: some View {
        SectionContainer(title: "Explore more") {
            path = [.exploreScreen]
        } content: {
            GroupedSquaredCardView(items: contentModel.getExploreData(), cardColor: .black) { model in
                path = [.chatScreenWithTopic(topic: model.title)]
            }
        }
    }
    
    private var promptLibrary: some View {
        VStack {
            SectionContainer(title: "Prompt library") {
            } content: {
                if let texts = contentModel.dashboardContents?.data?.promptLibrary {
                    MultiRowGroupedChipView(items: .constant(texts), maxItemPerRow: 4, bgColor: .black, fgColor: .white) { selected in
                        path = [.chatScreenWithTopic(topic: selected)]
                    }
                }
            }
        }
    }
}

#Preview {
    DashboardScreen(path: .constant([]))
        .environmentObject(ContentModel())
}
