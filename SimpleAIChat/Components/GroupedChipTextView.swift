//
//  GrouppedChipTextView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct GroupedChipTextView: View {
    @Binding var texts: [String]
    var onTap: (String) -> ()
    var chipBackgroundColor: Color = .white
    var chipForeground: Color = .black
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($texts, id: \.self) { text in
                    ChipTextView(text: text, onTap: onTap, textColor: chipForeground, bgColor: chipBackgroundColor)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GroupedChipTextView(texts: .constant(["This is the text 1", "Also text 2", "Mentioning text 3", "Don't forget the 4"]), onTap: { _ in})
}
