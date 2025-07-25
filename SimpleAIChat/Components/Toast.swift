//
//  Toast.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 14/07/25.
//

import Foundation
import SwiftUI

public enum ToastType {
    case info
    case warning
    case error
    case success
    
    var backgroundColor: Color {
        switch self {
        case .info:
            return Color.blue.opacity(0.8)
        case .warning:
            return Color.yellow.opacity(0.8)
        case .error:
            return Color.red.opacity(0.8)
        case .success:
            return Color.green.opacity(0.8)
        }
    }
    
    var iconName: String {
        switch self {
        case .info:
            return "info.circle"
        case .warning:
            return "exclamationmark.triangle"
        case .error:
            return "xmark.octagon"
        case .success:
            return "checkmark.circle"
        }
    }
}

struct ToastView: View {
    let toastType: ToastType
    let title: String
    let subtitle: String?
    
    @State private var countdown: Int = 5
    @State private var progress: CGFloat = 1.0
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        HStack(spacing: 16) {
            toastContentView
        }
        .padding()
        .background(toastType.backgroundColor.opacity(0.3))
        .cornerRadius(12)
        .shadow(color: colorScheme == .dark ? .clear : .black.opacity(0.15), radius: 12)
        .padding(.horizontal)
        .onAppear { startCountdown() }
    }
    
    private var toastContentView: some View {
        HStack(spacing: 16) {
            Image(systemName: toastType.iconName)
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundColor(.white)
                .background(Circle().fill(toastType.backgroundColor).frame(width: 25, height: 25))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }
    }
    
    private func startCountdown() {
        if countdown > -1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.linear(duration: 1)) {
                    countdown -= 1
                    progress = CGFloat(countdown) / 5.0
                }
                startCountdown()
            }
        }
    }
}

#Preview {
    @Previewable @State var isShowing: Bool = true
    VStack {
        if isShowing {
            ToastView(
                toastType: .info,
                title: "Info: Toast Message.",
                subtitle: "Sample Description"
            )
            ToastView(
                toastType: .error,
                title: "Error: Toast Message.",
                subtitle: nil
            )
            ToastView(
                toastType: .success,
                title: "Success: Toast Message.",
                subtitle: nil
            )
            ToastView(
                toastType: .warning,
                title: "Warning: Toast Message.",
                subtitle: nil
            )
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.init(uiColor: .secondarySystemGroupedBackground))
}

extension View {
    func showToast(
        isPresented: Binding<Bool>,
        type: ToastType,
        title: String,
        subtitle: String? = nil
    ) -> some View {
            self.overlay(
                ZStack {
                    if isPresented.wrappedValue {
                        ToastView(toastType: type, title: title, subtitle: subtitle)
                            .transition(.move(edge: .top).combined(with: .opacity))
                            .zIndex(1)
                    }
                }
            )
        }
}
