//
//  Chat.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import Foundation

struct Chat {
    let id: String = UUID().uuidString
    var topic: String
    var timestamp: Date
    var message: String
    var actor: Actor
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Chat {
    static let dummyChatFromUser: Chat = Chat(topic: "Programming", timestamp: Date(), message: "What is swiftUI?", actor: .dummyUser)
    static let dummyChatFromAIAssistant: Chat = Chat(topic: "Programming", timestamp: Date(), message: "SwiftUI is a user interface toolkit that lets you design apps in a declarative way.", actor: .dummyAIAssitant)
    
    static let dummyChats: [Chat] = [
        Chat(topic: "Programming", timestamp: Date(), message: "What is swiftUI?", actor: .dummyUser),
        Chat(topic: "Programming", timestamp: Date(), message: "SwiftUI is a user interface toolkit that lets you design apps in a declarative way.", actor: .dummyAIAssitant),
        Chat(topic: "Programming", timestamp: Date(), message: "What is combine framework?", actor: .dummyUser),
        Chat(topic: "Programming", timestamp: Date(), message: "Combine is a framework that provides a declarative Swift API for processing values over time.", actor: .dummyAIAssitant),
        Chat(topic: "Programming", timestamp: Date(), message: "What is the difference between swiftUI and combine framework?", actor: .dummyUser),
        Chat(topic: "Programming", timestamp: Date(), message: "SwiftUI is for building user interfaces, while Combine is for handling asynchronous events and data streams.", actor: .dummyAIAssitant),
        Chat(topic: "Programming", timestamp: Date(), message: "Thank you!", actor: .dummyUser),
        Chat(topic: "Programming", timestamp: Date(), message: "You're welcome! If you have any more questions, feel free to ask.", actor: .dummyAIAssitant)
    ]
}
