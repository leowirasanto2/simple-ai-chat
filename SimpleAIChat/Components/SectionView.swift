//
//  SectionView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import SwiftUI

struct SectionView<Content: View>: View {
    let title: String?
    let content: () -> Content

    init(title: String? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title = title {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.bottom, 4)
            }
            content()
        }
    }
}

#Preview {
    SectionView(title: "Section Title") {
        ForEach(0..<5) { index in
            Text("Item \(index)")
        }
    }
    .padding()
    .background(Color(.systemBackground))
}
