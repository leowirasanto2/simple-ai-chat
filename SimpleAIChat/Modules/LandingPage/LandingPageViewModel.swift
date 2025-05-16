//
//  LandingPageViewModel.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import Foundation

class LandingPageViewModel: ObservableObject {
    @Published var topics: [String] = [
        "Travel",
        "Food",
        "Technology",
        "Health",
        "Education"
    ]
    
    @Published var suggestions = [Suggestion]().dummySuggestions
    @Published var recentChats = Activity.dummyRecentChats
    @Published var showingChatBottomSheet = false
    @Published var selectedChats: [Chat] = []
    
    init() {
        self.populateData()
    }
    
    func populateData() {
        self.topics = [
            "Travel",
            "Food",
            "Technology",
            "Health",
            "Education"
        ]
        self.suggestions = [Suggestion]().dummySuggestions
        self.recentChats = Activity.dummyRecentChats
    }
    
    func resetSelectedChats () {
        self.selectedChats.removeAll()
    }
}
