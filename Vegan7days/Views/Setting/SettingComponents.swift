//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/8/22.
//

import SwiftUI

private let brandGreen = Color(hex: "#253900")

// 卡片容器
struct SettingsCard<Content: View>: View {
    @ViewBuilder var content: Content
    var body: some View {
        VStack(spacing: 0) { content }
            .background(Color.white.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(color: .black.opacity(0.12), radius: 10, y: 4)
    }
}

// 單列
struct SettingRow: View {
    enum Accessory { case toggle(Binding<Bool>), chevron, none }
    let systemIcon: String
    let title: String
    var accessory: Accessory = .chevron
    var action: (() -> Void)? = nil

    var body: some View {
        Group {
            switch accessory {
            case .toggle(let isOn):
                HStack(spacing: 14) {
                    icon
                    Text(title)
                    Spacer()
                    Toggle("", isOn: isOn).labelsHidden()
                }
            case .chevron:
                Button(action: { action?() }) {
                    HStack(spacing: 14) {
                        icon
                        Text(title)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.tertiary)
                    }
                }
                .buttonStyle(.plain)
            case .none:
                HStack(spacing: 14) { icon; Text(title); Spacer() }
            }
        }
        .font(.body)
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .overlay(Divider(), alignment: .bottom)
        .contentShape(Rectangle())
    }

    private var icon: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(brandGreen.opacity(0.15))
                .frame(width: 36, height: 36)
            Image(systemName: systemIcon)
                .foregroundStyle(brandGreen)
        }
    }
}
