//
//  GroupedSquaredCardView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct SquaredCardModel {
    var title: String
    var description: String
    var image: Image
}

struct GroupedSquaredCardView: View {
    var cardColor: Color = .gray
    var foregroundStyle: Color = .white
    var icon: Image = Image(systemName: "circle")
    @Binding var items: [SquaredCardModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($items, id: \.title) { item in
                    SquaredCardView(cardColor: cardColor, foregroundStyle: foregroundStyle, item: item)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    GroupedSquaredCardView(items: .constant([]))
}
