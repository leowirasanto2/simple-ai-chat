//
//  ChipTextView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct ChipTextView: View {
    @Binding var text: String
    var onTap: (String) -> ()
    var textColor: Color = .black
    var bgColor: Color = .white
    
    var body: some View {
        VStack {
            Button {
                onTap(text)
            } label: {
                Text(text)
                    .padding()
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(textColor)
                    .background(bgColor)
            }
            .frame(height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    ChipTextView(text: .constant("Text 1"), onTap: { _ in })
}
