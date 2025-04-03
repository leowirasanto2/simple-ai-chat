//
//  Suggestion.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import Foundation

struct Suggestion {
    let id = UUID()
    var title: String
    var subTitle: String
    var iconName: String
    var initialPrompt: String
}

extension Array where Element == Suggestion {
    var dummySuggestions: [Suggestion] {
        [
            Suggestion(
                title: "AI Code Assistant",
                subTitle: "Generate code snippets and functions",
                iconName: "chevron.left.slash.chevron.right",
                initialPrompt: "Write a function to calculate the factorial of a number."
            ),
            Suggestion(
                title: "AI Chatbot",
                subTitle: "Chat with AI assistant to get answers and suggestions",
                iconName: "robot",
                initialPrompt: "Hello, how can I assist you today?"
            ),
            Suggestion(
                title: "AI Writer",
                subTitle: "Generate text based on prompts and ideas, like stories or articles",
                iconName: "pencil",
                initialPrompt: "Write a story about a brave knight."
            ),
            Suggestion(
                title: "AI Translator",
                subTitle: "Translate text between languages like English and Spanish",
                iconName: "globe",
                initialPrompt: "Translate 'Hello' to Spanish."
            )
        ]
    }
}
