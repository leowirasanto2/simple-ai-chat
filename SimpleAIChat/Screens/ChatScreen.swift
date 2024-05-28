//
//  ChatScreen.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct ChatScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var chatModel: ChatModel
    @State var text: String = ""
    
    var body: some View {
        VStack {
            NavigationTitleView(title: "New chat") {
                dismiss()
            }
            .padding(.horizontal)
            ScrollView {
                ScrollViewReader { reader in
                    ForEach(chatModel.messages, id: \.id) { chatItem in
                        BubbleChatView(
                            message: chatItem.content ?? "",
                            role: chatItem.role?.bubbleChatRole ?? .replier)
                        .padding()
                        .id(chatItem.id)
                        .onAppear {
                            withAnimation {
                                reader.scrollTo(chatItem.id, anchor: .bottom)
                            }
                        }
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                HStack {
                    TextField("Type here...", text: $text)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.secondary.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: .infinity))
    
                    Button {
                        guard !text.isEmpty && !chatModel.isSending else { return }
                        Task {
                            await chatModel.sendDummy(text)
                            text = ""
                        }
                    } label: {
                        if chatModel.isSending {
                            ProgressView()
                                .scaledToFit()
                                .frame(height: 25)
                                .foregroundStyle(.white)
                                .padding()
                        } else {
                            Image(systemName: "paperplane.fill")
                                .imageScale(.medium)
                                .foregroundStyle(.white)
                                .padding()
                        }
                    }
                    .background(Color.secondary.opacity(0.5))
                    .clipShape(Circle())
                }
                .padding()
            }
            .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 10, topTrailing: 10)))
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(.linearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom))
        .onAppear {
            chatModel.setup()
        }
    }
}

#Preview {
    ChatScreen()
        .environmentObject(ChatModel())
}
