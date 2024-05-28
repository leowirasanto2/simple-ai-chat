//
//  CalloutChatView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI
import OpenAISwift

enum BubbleChatRole: Equatable {
    case sender
    case replier
    
    var alignment: (HorizontalAlignment, TextAlignment) {
        switch self {
        case .sender:
            return (.trailing, .trailing)
        case .replier:
            return (.leading, .leading)
        }
    }
    
    var bubbleColor: Color {
        switch self {
        case .sender:
            return .gray
        case .replier:
            return .green
        }
    }
}

extension ChatRole {
    var bubbleChatRole: BubbleChatRole {
        switch self {
        case .system, .assistant:
            return .replier
        case .user:
            return .sender
        }
    }
}

struct BubbleChatView: View {
    var message: String
    var role: BubbleChatRole
    
    private var formattedTimeChat: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, hh:mm"
        return formatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            switch role {
            case .sender:
                Spacer()
                bubbleChatView
            case .replier:
                bubbleChatView
                Spacer()
            }
        }
    }
    
    private var bubbleChatView: some View {
        VStack(alignment: role.alignment.0) {
            Text(message)
                .colorInvert()
                .padding()
                .font(.callout)
                .multilineTextAlignment(role.alignment.1)
                .background(role.bubbleColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(formattedTimeChat)
                .font(.footnote)
                .foregroundStyle(role.bubbleColor)
        }
    }
}

#Preview {
    BubbleChatView(message: "This is the chat is the chat is the chat is the chat is the chat", role: .replier)
        .padding()
}
