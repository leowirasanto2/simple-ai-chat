//
//  ChipTextView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct ChipTextView: View {
    var text: String
    var onTap: (String) -> ()
    var textColor: Color = .black
    var bgColor: Color = .white
    
    var body: some View {
        VStack {
            Button {
                onTap(text)
            } label: {
                Text(text)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(textColor)
                    .background(bgColor)
            }
            .clipShape(RoundedRectangle(cornerRadius: .infinity))
        }
    }
}

#Preview {
    ChipTextView(text: "Text 1", onTap: { _ in })
        .background(.black)
}
