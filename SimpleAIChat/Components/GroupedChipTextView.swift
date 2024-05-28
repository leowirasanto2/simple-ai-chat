//
//  GrouppedChipTextView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct GroupedChipTextView: View {
    var texts: [String]
    var bgColor: Color = .white
    var fgColor: Color = .black
    var onTap: (String) -> ()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(texts, id: \.self) { text in
                    ChipTextView(text: text, onTap: onTap, fgColor: fgColor, bgColor: bgColor)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    GroupedChipTextView(texts: ["This is the text 1", "Also text 2", "Mentioning text 3", "Don't forget the 4"], onTap: { _ in})
        .background(.black)
}
