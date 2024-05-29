//
//  SectionContainer.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 29/05/24.
//

import SwiftUI

struct SectionContainer<Content: View>: View {
    var title: String
    var titleIcon: Image?
    var titleTintColor: Color = .black
    var onTitleTapped: () -> Void
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionTitleView(tintColor: titleTintColor, title: title, icon: titleIcon, onTapped: onTitleTapped)
                .padding(.horizontal)
            content
        }
    }
}

#Preview {
    SectionContainer(title: "Title here") {
    } content: {
        Text("any view could replace me")
    }

}
