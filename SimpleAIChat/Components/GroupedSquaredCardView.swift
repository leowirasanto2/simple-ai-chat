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
    var items: [SquaredCardModel]
    var cardColor: Color = .gray
    var foregroundStyle: Color = .white
    var icon: Image = Image(systemName: "circle")
    var onTap: (SquaredCardModel) -> ()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(items, id: \.title) { item in
                    SquaredCardView(item: item, cardColor: cardColor, foregroundStyle: foregroundStyle, onTap: onTap)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    GroupedSquaredCardView(items: [
        SquaredCardModel(title: "Title", description: "description", image: Image(systemName: "square.and.arrow.up"))
    ], onTap: { _ in })
        .background(.black)
}
