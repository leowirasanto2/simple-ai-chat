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
    @State var promptText: String = ""
    
    var body: some View {
        VStack {
            NavigationTitleView(tintColor: .black, title: "New chat") {
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
                    TextField("Type here...", text: $promptText)
                        .foregroundStyle(.black)
                        .padding()
                        .background(Color.secondary.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: .infinity))
    
                    Button {
                        guard !promptText.isEmpty && !chatModel.isSending else { return }
                        Task {
                            await chatModel.sendDummy(promptText)
                            promptText = ""
                        }
                    } label: {
                        if chatModel.isSending {
                            ProgressView()
                                .imageScale(.medium)
                                .foregroundStyle(.white)
                                .padding()
                        } else {
                            Image(systemName: "paperplane.fill")
                                .imageScale(.medium)
                                .foregroundStyle(.white)
                                .padding()
                        }
                    }
                    .background(Color.green)
                    .clipShape(Circle())
                }
                .padding()
            }
            .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 10, topTrailing: 10)))
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            chatModel.setup()
        }
    }
}

#Preview {
    ChatScreen()
        .environmentObject(ChatModel())
}
