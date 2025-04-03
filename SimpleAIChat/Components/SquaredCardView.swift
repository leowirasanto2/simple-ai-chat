//
//  SquaredCardView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import SwiftUI

struct SquaredCardView: View {
    enum Constants {
        static let cardSize: CGFloat = 120
    }
    
    var icon: Image
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            icon
            Text(title)
                .font(.headline)
                .lineLimit(1)
            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
        }
        .frame(width: Constants.cardSize, height: Constants.cardSize)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .elevate()
    }
}

#Preview {
    SquaredCardView(
        icon: Image(systemName: "star"),
        title: "Example Title",
        description: "This is a short description that is limited to three lines."
    )
}
