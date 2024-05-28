//
//  NavigationTitleView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 28/05/24.
//

import SwiftUI

struct NavigationTitleView: View {
    var title: String
    var onBackTapped: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button(action: onBackTapped, label: {
                Image(systemName: "arrow.left.circle.fill")
                    .imageScale(.large)
            })
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding(.vertical)
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationTitleView(title: "Title's here") {}
        .background(.black)
}
