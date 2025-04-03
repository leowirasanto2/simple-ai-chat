//
//  ChipView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

import SwiftUI

struct ChipView: View {
    var text: String
    var icon: Image?
    var action: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            if let icon = icon {
                icon
            }
            Text(text)
                .font(.subheadline)
                .lineLimit(1)
                .fixedSize()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(.white)
        .cornerRadius(16)
        .elevate()
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    ChipView(text: "Chip Button", icon: Image(systemName: "star.fill")) {
        print("Chip tapped")
    }
}
