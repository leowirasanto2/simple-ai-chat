//
//  SectionTitleView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct SectionTitleView: View {
    var title: String
    var icon: Image? = Image(systemName: "arrow.right.circle.fill")
    var onTapped: () -> ()
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Spacer()
            
            if icon != nil {
                Button {
                    
                } label: {
                    icon!
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

#Preview {
    SectionTitleView(title: "", onTapped: {})
}
