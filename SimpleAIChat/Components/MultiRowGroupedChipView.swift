//
//  MultiRowGroupedChipView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import SwiftUI

struct MultiRowGroupedChipView: View {
    @Binding var items: [String]
    var maxItemPerRow: Int = 3
    var onTap: (String) -> ()
    var chipBackgroundColor: Color = .white
    var chipForeground: Color = .black
    
    var body: some View {
        VStack {
            ForEach(Array(groupedItems), id: \.key) { (_, _items) in
                GroupedChipTextView(texts: .constant(_items), onTap: onTap)
            }
        }
    }
    
    private var groupedItems: [Int: [String]] {
        var result = [Int: [String]]()
        var rowNum = 0
        
        items.enumerated().forEach { (index, element) in
            if let current = result[rowNum], current.count < maxItemPerRow {
                result[rowNum]?.append(element)
            } else {
                rowNum += 1
                result[rowNum] = [element]
            }
        }
        return result
    }
}

#Preview {
    MultiRowGroupedChipView(items: .constant(["a", "b", "b", "b", "b", "b", "b", "b", "b"]), onTap: { _ in })
}
