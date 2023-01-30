//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 01/02/22.
//
#if canImport(UIKit)
import SwiftUI
import UIKit
@available(iOS 14, *)
extension Color {
    public init(h: CGFloat, s: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(UIColor(hue: h / 360, saturation: s / 100, brightness: b / 100, alpha: alpha))
    }
    
    public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a))
    }
}

@available(iOS 14, *)
extension Color {
    @available(iOS 14.0, *)
    public func modified(withAdditionalHue hue: CGFloat, additionalSaturation: CGFloat, additionalBrightness: CGFloat, additionalAlpha: CGFloat) -> Color {
        
        var uiColor = self.uiColor
        
        uiColor = uiColor.modified(withAdditionalHue: hue, additionalSaturation: additionalSaturation, additionalBrightness: additionalBrightness, additionalAlpha: additionalAlpha)
        
        return Color(uiColor)
    }
}

@available(iOS 14, *)
extension Color {
    
    @available(iOS 14.0, *)
    public var uiColor: UIColor {
        UIColor(self)
    }
    
}
#endif
