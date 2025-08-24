//
//  LandingPageViewModelTests.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 17/05/25.
//

import XCTest
@testable import SimpleAIChat

class LandingPageViewModelTests: XCTestCase {

    var sut: LandingPageViewModel!

    override func setUp() {
        super.setUp()
        sut = LandingPageViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testInitialTopics() {
        let expectedTopics = ["Travel", "Food", "Technology"]
        XCTAssertEqual(sut.topics, expectedTopics, "Topics should match the expected default values")
    }

    func testPopulateDataResetsValues() {
        // Modify the properties to verify that populateData resets them.
        sut.topics = []
        sut.suggestions = []
        sut.recentChats = []

        sut.populateData()

        let expectedTopics = ["Travel", "Food", "Technology", "Health", "Education"]
        XCTAssertEqual(sut.topics, expectedTopics, "populateData should reset topics to the default values")
        XCTAssertFalse(sut.suggestions.isEmpty, "populateData should set dummy suggestions")
        XCTAssertFalse(sut.recentChats.isEmpty, "populateData should set dummy recent chats")
    }

    func testDummySuggestionsIsNotEmpty() {
        XCTAssertFalse(sut.suggestions.isEmpty, "Initial dummy suggestions should not be empty")
    }

    func testDummyRecentChatsIsNotEmpty() {
        XCTAssertFalse(sut.recentChats.isEmpty, "Initial dummy recent chats should not be empty")
    }
}
