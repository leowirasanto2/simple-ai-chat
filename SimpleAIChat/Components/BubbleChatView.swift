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
            return .white
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
    var message: String = "This is the chat is the chat is the chat is the chat is the chat"
    var role: BubbleChatRole = .replier
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
                .font(.callout)
                .multilineTextAlignment(role.alignment.1)
                .padding()
                .background(role.bubbleColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.black)
            Text(formattedTimeChat)
                .font(.footnote)
                .foregroundStyle(.white)
        }
    }
    
}

#Preview {
    BubbleChatView()
}
