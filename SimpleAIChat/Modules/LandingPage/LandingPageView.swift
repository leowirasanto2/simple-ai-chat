//
//  LandingPageView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//
import SwiftUI

struct LandingPageView: View {
    @ObservedObject var viewModel = LandingPageViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 32) {
                    HStack {
                        Text("SimpleAIChat")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Image(systemName: "sparkles")
                            .imageScale(.large)
                            
                    }

                    SectionView(title: "Try to start a conversation") {
                        carouselSuggestions
                    }
                    SectionView(title: "Topics you might like") {
                        topicChips
                    }
                    SectionView(title: "Recent chats") {
                        recentChatView
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            .scrollClipDisabled()
            
            VStack {
                Spacer()
                
                Button {
                    viewModel.showingChatBottomSheet = true
                } label: {
                    HStack {
                        Text("Start a new chat")
                            .fontWeight(.bold)
                        
                        Image(systemName: "sparkles")
                            .imageScale(.medium)
                    }
                    .padding()
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .elevate()
                }
                .foregroundStyle(.white)
            }
        }
        .sheet(isPresented: $viewModel.showingChatBottomSheet) {
            ChatPageView(messages: viewModel.selectedChats) {
                viewModel.showingChatBottomSheet.toggle()
            }
            .presentationDetents([.large])
            .onAppear {
                // Reset selected chats when the sheet is dismissed
                viewModel.resetSelectedChats()
            }
        }
    }
    
    @ViewBuilder
    private var topicChips: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.topics, id: \.self) { topic in
                    ChipView(text: topic, action: {})
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
    }
    
    @ViewBuilder
    private var carouselSuggestions: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.suggestions, id: \.id) { suggestion in
                    SquaredCardView(
                        icon: .init(systemName: suggestion.iconName),
                        title: suggestion.title,
                        description: suggestion.subTitle
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
    }
    
    @ViewBuilder
    private var recentChatView: some View {
        LazyVStack(spacing: 16) {
            ForEach(viewModel.recentChats, id: \.id) { chat in
                ListItem(
                    title: chat.title,
                    subtitle: chat.subTitle,
                    leading: {},
                    trailing: {
                        //three dot icon vertical
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                            .imageScale(.small)
                    }
                )
                .onTapGesture {
                    self.viewModel.selectedChats = chat.previousChat
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.viewModel.showingChatBottomSheet = true
                    }
                }
                
                Divider()
            }
        }
    }
}

#Preview {
    LandingPageView()
}
