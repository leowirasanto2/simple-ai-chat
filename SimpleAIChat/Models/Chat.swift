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

