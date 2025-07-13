//
//  ChatTextFieldView.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 13/07/25.
//

import SwiftUI

struct ChatTextFieldView: View {
    @Binding var text: String
    @State var placeholder: String = "Start with simple prompt"
    @State var isMultilineMode = false
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $text, axis: .vertical)
                .lineLimit(1...)
                .padding(16)
            
            Spacer()
            
            HStack {
                // Model type chip
                // no background, rounded corners, gray border color
                Button {
                    print("No feature yet for model type selection")
                } label: {
                    Text("3o-mini")
                        .padding(8)
                        .background(.gray.opacity(0.2))
                        .foregroundStyle(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(16)
                
                Spacer()
                
                // always attached to the right side
                // Icon Send button
                Button(action: {
                    print("Send button tapped with text: \(text)")
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                }
                .padding(16)
            }
        }
        .simultaneousGesture(
            DragGesture()
                .onChanged { gesture in }
                .onEnded { gesture in
                    let verticalTranslation = gesture.translation.height
                    let swipeThreshold: CGFloat = 50 // Minimum vertical distance for a swipe
                    
                    if verticalTranslation < -swipeThreshold {
                        withAnimation {
                            isMultilineMode = true
                        }
                    } else if verticalTranslation > swipeThreshold {
                        withAnimation {
                            isMultilineMode = false
                        }
                    }
                }
        )
        .frame(maxHeight: isMultilineMode ? 250 : 130)
    }
}

#Preview {
    @Previewable @State var text: String = ""
    
    VStack(spacing: 0) {
        ScrollView {
            ForEach(0..<10) {
                Text("Scrollable items \($0)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
        }
        
        // Rounded rectangle with elevate effect
        ChatTextFieldView(text: $text)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .elevate()
            .padding(.bottom, -32)
    }
}
