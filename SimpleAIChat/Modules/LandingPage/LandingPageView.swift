//
//  LandingPageView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//
import SwiftUI

struct LandingPageView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                SectionView(title: "Slider") {
                    Text("Slider content goes here")
                }
                SectionView(title: "Carousel suggestions, squared") {
                    Text("Carousel suggestions container")
                }
                SectionView(title: "Topic libraries, to help start chat") {
                    Text("Topic libraries container")
                }
                SectionView {
                    Text("Chat history list")
                    Button("Start new chat", action: {})
                        .padding(.top, 8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    LandingPageView()
}
