//
//  DashboardScreen.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct DashboardScreen: View {
    @State var chatHistory = [
        "SwiftUI Tutorial",
        "Crypto trading tips",
        "What's crypto?",
        "Web3 app ideas"
    ]
    @State var selectedText: String = ""
    
    var body: some View {
        ScrollView {
            newChatBtn
            chatHistorySection
            Text(selectedText)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
    
    private var newChatBtn: some View {
        Button {
            
        } label: {
            HStack {
                Spacer()
                Text("New Chat")
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: .infinity))
        .padding()
    }
    
    private var chatHistorySection: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Chat History")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                }
            }
            .padding()
            
            GroupedChipTextView(texts: $chatHistory) { selected in
                selectedText = selected
            }
        }
    }
}

#Preview {
    DashboardScreen()
}
