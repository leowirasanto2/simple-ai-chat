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
    
    @Published var suggestions = [Suggestion]()
    @Published var recentChats = Activity.dummyRecentChats
    @Published var showingChatBottomSheet = false
    @Published var selectedChats: [Chat] = []
    
    private var suggestionRepo: SuggestionsRepoProtocol
    
    init(suggestionRepo: SuggestionsRepoProtocol = SuggestionsRepo()) {
        self.suggestionRepo = suggestionRepo
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
        self.recentChats = Activity.dummyRecentChats
        
        self.fetchSuggestions()
    }
    
    func fetchSuggestions() {
        suggestionRepo.fetchSuggestions { result in
            switch result {
            case .success(let response):
                self.suggestions = response
            case .failure(let error):
                print("Error fetching suggestions: \(error)")
                break
            }
        }
    }
}
