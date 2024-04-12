//
//  DashboardContentModel.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import Foundation

struct DashboardContentModel: Codable {
    var success: Bool
    var data: ContentData?
}

struct ContentData: Codable {
    var historyHighlight: [String]?
    var promptLibrary: [String]?
    var exploreDataHighlight: [ExploreData]?
}
        
struct ExploreData: Codable {
    var title: String
    var description: String
    var imageUrl: String
}
