//
//  PathRoute.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import Foundation

enum PathRoute: Hashable {
    case chatScreen
    case chatScreenWithTopic(topic: String)
    case historyScreen
    case exploreScreen
}
