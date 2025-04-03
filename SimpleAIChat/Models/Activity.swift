//
//  Activity.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import Foundation

struct Activity {
    var id: String = UUID().uuidString
    var title: String
    var subTitle: String
    var previousChat: [Chat] = []
}

extension Activity {
    static let dummyRecentChats: [Activity] = [
        // About swift programming
        Activity(
            title: "Programming",
            subTitle: "Talking about swiftUI and combine framework compared to Flutter",
            previousChat: [
                Chat(topic: "Programming", timestamp: Date(), message: "What is swiftUI?", actor: .dummyUser),
                Chat(topic: "Programming", timestamp: Date(), message: "SwiftUI is a user interface toolkit that lets you design apps in a declarative way.", actor: .dummyAIAssitant),
                Chat(topic: "Programming", timestamp: Date(), message: "What is combine framework?", actor: .dummyUser),
                Chat(topic: "Programming", timestamp: Date(), message: "Combine is a framework that provides a declarative Swift API for processing values over time.", actor: .dummyAIAssitant),
                Chat(topic: "Programming", timestamp: Date(), message: "What is the difference between swiftUI and combine framework?", actor: .dummyUser),
                Chat(topic: "Programming", timestamp: Date(), message: "SwiftUI is for building user interfaces, while Combine is for handling asynchronous events and data streams.", actor: .dummyAIAssitant),
                Chat(topic: "Programming", timestamp: Date(), message: "Thank you!", actor: .dummyUser),
                Chat(topic: "Programming", timestamp: Date(), message: "You're welcome! If you have any more questions, feel free to ask.", actor: .dummyAIAssitant)
            ]
        ),
        
        // About baking a croissant
        Activity(
            title: "Cooking",
            subTitle: "Talking about how to bake a croissant",
            previousChat: [
                Chat(topic: "Cooking", timestamp: Date(), message: "How to bake a croissant?", actor: .dummyUser),
                Chat(topic: "Cooking", timestamp: Date(), message: "To bake a croissant, you need to prepare the dough, roll it out, and shape it into a crescent. Then, let it rise before baking.", actor: .dummyAIAssitant),
                Chat(topic: "Cooking", timestamp: Date(), message: "What are the ingredients?", actor: .dummyUser),
                Chat(topic: "Cooking", timestamp: Date(), message: "The main ingredients are flour, water, yeast, sugar, salt, and butter.", actor: .dummyAIAssitant)
            ]
        ),
        
        // About cars
        Activity(
            title: "Cars",
            subTitle: "Talking about the latest car models",
            previousChat: [
                Chat(topic: "Cars", timestamp: Date(), message: "What are the latest car models?", actor: .dummyUser),
                Chat(topic: "Cars", timestamp: Date(), message: "The latest car models include the Tesla Model S, Ford Mustang Mach-E, and the Chevrolet Corvette.", actor: .dummyAIAssitant)
            ]
        )
    ]
}
