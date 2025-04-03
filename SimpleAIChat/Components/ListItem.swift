//
//  ListItem.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 03/04/25.
//

// Swift
import SwiftUI

struct DefaultCenterView: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.body)
            Text(subtitle)
                .font(.body)
                .foregroundColor(.gray)
                .lineLimit(1)
        }
    }
}

struct ListItem<Leading: View, Center: View, Trailing: View>: View {
    let leading: Leading?
    let center: Center
    let trailing: Trailing?

    init(
        @ViewBuilder leading: () -> Leading?,
        @ViewBuilder center: () -> Center,
        @ViewBuilder trailing: () -> Trailing?
    ) {
        self.leading = leading()
        self.center = center()
        self.trailing = trailing()
    }
    
    // Convenience initializer for default center view (title/subtitle)
    init(
        title: String,
        subtitle: String,
        @ViewBuilder leading: () -> Leading?,
        @ViewBuilder trailing: () -> Trailing?
    ) where Center == DefaultCenterView {
        self.leading = leading()
        self.center = DefaultCenterView(title: title, subtitle: subtitle)
        self.trailing = trailing()
    }
    
    var body: some View {
        HStack {
            if let leading = leading {
                leading
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.2, alignment: .leading)
            }
            center
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)
            if let trailing = trailing {
                trailing
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.2, alignment: .trailing)
            }
        }
    }
}

#Preview(body: {
    ListItem(
        title: "Title",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        leading: {
            Image(systemName: "chevron.left")
                .imageScale(.small)
        },
        trailing: {
            Image(systemName: "chevron.right")
                .imageScale(.small)
        }
    )
})
