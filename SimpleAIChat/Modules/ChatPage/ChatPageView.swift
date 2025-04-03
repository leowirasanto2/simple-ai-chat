//
//  ChatPageView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//
// Swift
// File: ChatPageView.swift
import SwiftUI

struct ChatPageView: View {
    @State var messages: [Chat] = []
    @State private var newMessage: String = ""
    @State private var topic: String = ""
    @State private var currentActor: Actor = .dummyUser
    var onBackTapped: () -> Void

    var body: some View {
        VStack {
            HStack {
                // back button with left arrow
                // in the circle background
                Button(action: onBackTapped) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.primary)
                        .padding()
                        .background(Circle().fill(.white))
                        .elevate()
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        if messages.isEmpty {
                            VStack(alignment: .center) {
                                Image(systemName: "sparkles")
                                    .imageScale(.large)
                                Text("Start a conversation with me")
                                    .font(.headline)
                                    .padding(.top, 8)
                            }
                            .foregroundStyle(.secondary)
                        } else {
                            ForEach(messages, id: \.id) { chat in
                                ChatBubble(chat: chat)
                                    .padding(.horizontal)
                                    .id(chat.id)
                            }
                        }
                    }
                }
                .padding(.vertical)
                .scrollClipDisabled()
                .onAppear {
                    if let lastMessage = messages.last {
                        // Scroll to last message on appear
                        proxy.scrollTo(lastMessage.id, anchor: .bottom)
                    }
                }
                .onChange(of: messages.count) { _ in
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            
            HStack {
                TextField("Enter message...", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
        .navigationBarTitle("Chat", displayMode: .inline)
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let chat = Chat(topic: topic, timestamp: .now, message: newMessage, actor: currentActor == .dummyUser ? .dummyUser : .dummyAIAssitant)
        messages.append(chat)
        newMessage = ""
        currentActor = currentActor == .dummyUser ? .dummyAIAssitant : .dummyUser
    }
}

#Preview {
    ChatPageView() {}
}
