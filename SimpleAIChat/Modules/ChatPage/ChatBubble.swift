//
//  ChatBubble.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import SwiftUI

struct ChatBubble: View {
    @State var chat: Chat

    var body: some View {
        VStack(alignment: chat.actor.role == .aiAssistant ? .leading : .trailing) {
            HStack {
                if chat.actor.role == .user {
                    Spacer()  // User messages are aligned to the right.
                }
                Text(chat.message)
                    .padding(10)
                    .foregroundColor(chat.actor.role == .user ? .white : .black)
                    .background(chat.actor.role == .user ? Color.blue : Color.gray.opacity(0.2))
                    .cornerRadius(10)
                if chat.actor.role == .aiAssistant {
                    Spacer()  // System messages are aligned to the left.
                }
            }
            
            Text(getFormattedTimestamp())
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private func getFormattedTimestamp() -> String {
        let dateFormatter = DateFormatter()
        // date/month/year hour:minute
        dateFormatter.dateFormat = "d/M/yy, HH:mm"
        return dateFormatter.string(from: chat.timestamp)
    }
}

#Preview {
    ChatBubble(chat: Chat.dummyChatFromUser)
}
