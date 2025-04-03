//
//  Actor.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import Foundation

struct Actor {
    let id: String = UUID().uuidString
    let name: String
    let avatar: String
    let description: String
    let role: ActorRole
}

enum ActorRole {
    case user
    case aiAssistant
}

extension Actor: Equatable {
    static func == (lhs: Actor, rhs: Actor) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Actor {
    static let dummyUser = Actor(
        name: "User",
        avatar: "https://example.com/user_avatar.png",
        description: "This is a user.",
        role: .user
    )
    
    static let dummyAIAssitant = Actor(
        name: "AI Assistant",
        avatar: "https://example.com/ai_avatar.png",
        description: "This is an AI assistant.",
        role: .aiAssistant
    )
}
