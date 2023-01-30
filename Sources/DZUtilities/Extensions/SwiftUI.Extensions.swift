//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 22/11/22.
//

import SwiftUI

private struct SafeAreaInsetsEnvironmentKey: EnvironmentKey {
    static let defaultValue: (top: CGFloat, bottom: CGFloat) = (0, 0)
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public extension EnvironmentValues {
    var safeAreaInsets: (top: CGFloat, bottom: CGFloat) {
        get { self[SafeAreaInsetsEnvironmentKey.self] }
        set { self[SafeAreaInsetsEnvironmentKey.self] = newValue }
    }
}

public struct SizePreferenceKey: PreferenceKey {
    public static var defaultValue: CGSize = .zero
    public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public extension View {
    func readSize(isActive: Bool = true, onChange: @escaping (CGSize) -> Void) -> some View {
        Group {
            if isActive {
                background(
                    GeometryReader { geometryProxy in
                        Color.clear.preference(key: SizePreferenceKey.self, value: geometryProxy.size)
                    }
                )
                .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
            }
        }
    }
}
