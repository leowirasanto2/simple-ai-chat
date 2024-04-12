//
//  ChatModel.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import Foundation
import OpenAISwift

@MainActor
class ChatModel: ObservableObject {
    private var client: OpenAISwift?
    
    @Published var messages: [ChatMessage] = []
    @Published var isSending = false
    
    func setup() {
        let privateKey = ""
        let config = OpenAISwift.Config.makeDefaultOpenAI(apiKey: privateKey)
        client = OpenAISwift(config: config)
    }
    
    func send(_ message: String, _ completion: @escaping (String) -> Void) {
        client?.sendChat(with: [ChatMessage(role: .user, content: message)], completionHandler: { result in
            switch result {
            case .success(let response):
                let output = response.choices?.first?.message.content ?? ""
                completion(output)
            case .failure(let error):
                completion(error.localizedDescription)
            }
        })
    }
    
    func sendDummy(_ message: String) async {
        messages.append(ChatMessage(role: .user, content: message))
        isSending = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.messages.append(ChatMessage(role: .assistant, content: "Hello, this is a dummy reply number (\(self.messages.count - 1))"))
            self.isSending = false
        }
    }
}
