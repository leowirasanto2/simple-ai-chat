//
//  ContentModel.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import Dependencies
import Foundation
import SwiftUI

@MainActor
class ContentModel: ObservableObject {
    @Published var dashboardContents: DashboardContentModel? = nil
    @Dependency(\.dummyJsonService) var dummyJsonService
    
    init() {
        
    }
    
    func onAppear() {
        
    }
    
    func onDisappear() {
        
    }
    
    func getExploreData() -> [SquaredCardModel] {
        guard let data = dashboardContents?.data?.exploreDataHighlight else { return [] }
        return data.map { SquaredCardModel(
            title: $0.title,
            description: $0.description,
            image: Image(systemName: $0.imageUrl)) }
    }
    
    func loadContents() async throws {
        let content: DashboardContentModel = try await dummyJsonService.get(.success)
        dashboardContents = content
    }
}
