//
//  SquaredCardView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct SquaredCardView: View {
    var cardColor: Color = .gray
    var foregroundStyle: Color = .white
    @Binding var item: SquaredCardModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                item.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28)
                
                Text(item.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(item.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                    .fontWeight(.regular)
                
                Spacer()
            }
            .padding()
        }
        .foregroundStyle(foregroundStyle)
        .frame(width: 150, height: 150)
        .background(cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SquaredCardView(item: .constant(SquaredCardModel(title: "This is title", description: "This is the placeholder of description", image: Image(systemName: "keyboard"))))
}
