//
//  Suggestion.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import Foundation

struct Suggestion: Codable, Equatable {
    let id: String
    var title: String
    var subTitle: String
    var iconName: String
    var initialPrompt: String
}
