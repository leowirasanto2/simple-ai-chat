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
            newChatBtn
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
        .task {
            do {
                try await contentModel.loadContents()
            } catch {
                print("unable to load contents")
            }
        }
        .onAppear {
            contentModel.onAppear()
        }
        .onDisappear {
            contentModel.onDisappear()
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
            
            if let texts = contentModel.dashboardContents?.data?.historyHighlight {
                GroupedChipTextView(texts: .constant(texts)) { selected in
                    path = [.chatScreenWithTopic(topic: selected)]
                }
            }
        }
    }
    
    private var exploreMoreView: some View {
        VStack {
            SectionTitleView(title: "Explore More") {
                path = [.exploreScreen]
            }
            .padding()
            
            GroupedSquaredCardView(items: .constant(contentModel.getExploreData())) { model in
                path = [.chatScreenWithTopic(topic: model.title)]
            }
        }
    }
    
    private var promptLibrary: some View {
        VStack {
            SectionTitleView(title: "Prompt library") {}
                .padding()
            
            if let texts = contentModel.dashboardContents?.data?.promptLibrary {
                MultiRowGroupedChipView(items: .constant(texts), maxItemPerRow: 4) { selected in
                    path = [.chatScreenWithTopic(topic: selected)]
                }
            }
        }
    }
}

#Preview {
    DashboardScreen(path: .constant([]))
}
