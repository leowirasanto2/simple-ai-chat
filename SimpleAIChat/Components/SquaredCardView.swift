//
//  SquaredCardView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct SquaredCardView: View {
    var item: SquaredCardModel
    var cardColor: Color = .gray
    var foregroundStyle: Color = .white
    var onTap: (SquaredCardModel) -> ()
    
    var body: some View {
        Button {
            onTap(item)
        } label: {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    item.image
                        .imageScale(.large)
                    
                    Group {
                        Text(item.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text(item.description)
                            .font(.caption)
                            .fontWeight(.regular)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    
                }
                .padding()
            }
            .foregroundStyle(foregroundStyle)
            .frame(width: 150, height: 150)
            .background(cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    SquaredCardView(item: SquaredCardModel(title: "This is title", description: "This is the placeholder of description", image: Image(systemName: "keyboard")), onTap: { _ in })
}
