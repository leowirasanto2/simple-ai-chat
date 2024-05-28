//
//  SectionTitleView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct SectionTitleView: View {
    var tintColor: Color = .white
    var title: String
    var icon: Image?
    var onTapped: () -> ()
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
            
            if icon != nil {
                Button {
                    onTapped()
                } label: {
                    icon!
                        .imageScale(.large)
                }
            }
        }
        .foregroundStyle(tintColor)
    }
}

#Preview {
    SectionTitleView(title: "Title preview", icon: Image(systemName: "arrow.right.circle.fill"), onTapped: {})
        .background(.black)
}
