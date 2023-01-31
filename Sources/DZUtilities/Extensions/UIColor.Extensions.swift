//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 22/11/21.
//
#if canImport(UIKit)
import UIKit
import SwiftUI

extension UIColor {
	
	public var hexString: String {
		let cgColorInRGB = cgColor.converted(to: CGColorSpace(name: CGColorSpace.sRGB)!, intent: .defaultIntent, options: nil)!
		let colorRef = cgColorInRGB.components
		let r = colorRef?[0] ?? 0
		let g = colorRef?[1] ?? 0
		let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
		let a = cgColor.alpha

		var color = String(
			format: "#%02lX%02lX%02lX",
			lroundf(Float(r * 255)),
			lroundf(Float(g * 255)),
			lroundf(Float(b * 255))
		)

		if a < 1 {
			color += String(format: "%02lX", lroundf(Float(a * 255)))
		}

		return color
	}
	
	// Construct a color from HEXRGB
	public convenience init?(hex: String) {
		let r, g, b, a: CGFloat
		
		if hex.hasPrefix("#") {
			let start = hex.index(hex.startIndex, offsetBy: 1)
			let hexColor = String(hex[start...])
			
			let scanner = Scanner(string: hexColor)
			var hexNumber: UInt64 = 0
			
			if scanner.scanHexInt64(&hexNumber) {
				if hexColor.count == 8 {
					r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					a = CGFloat(hexNumber & 0x000000ff) / 255
					
					self.init(red: r, green: g, blue: b, alpha: a)
					return
				} else if hexColor.count == 6 {
					r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
					g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
					b = CGFloat(hexNumber & 0x0000FF) / 255.0
					self.init(red: r, green: g, blue: b, alpha: 1)
					return
				}
			}
		}
		
		return nil
	}
    
    // Construct a color from rgb values 0-255
    public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat) {
        self.init(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    /**
     Construct a color from HSB values 0-360, 0-100, 0-100, 0-1
     
     *Values*
     
     `h` Hue goes from 0 to 360.
     
     `s` Saturation goes from 0 to 100.
     
     `b` Brightness goes from 0 to 100.
     
     'a' Alpha from 0 to 1.
     
     - Author:
     Daniel Zanchi
     - Version:
     0.1
     */
    public convenience init(h: Int, s: Int, b: Int, alpha: CGFloat) {
        self.init(
            hue: CGFloat(h) / 360,
            saturation: CGFloat(s) / 100,
            brightness: CGFloat(b) / 100,
            alpha: CGFloat(alpha)
        )
    }
}

extension UIColor {
    
    public func image(ofSize size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
}


extension UIColor {
    public func modified(withAdditionalHue hue: CGFloat, additionalSaturation: CGFloat, additionalBrightness: CGFloat, additionalAlpha: CGFloat) -> UIColor {
        
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0
        
        if self.getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrigthness, alpha: &currentAlpha) {
            currentHue = currentHue * 360
            currentSaturation = currentSaturation * 100
            currentBrigthness = currentBrigthness * 100
            
            var resultSaturation = currentSaturation + additionalSaturation
            if resultSaturation < 0 { resultSaturation = 0 }
            if resultSaturation > 100 { resultSaturation = 100 }
            
            var resultBrightness = currentBrigthness + additionalBrightness
            if resultBrightness < 0 { resultBrightness = 0 }
            if resultBrightness > 100 { resultBrightness = 100 }
            
            var resultAlpha = (currentAlpha + additionalAlpha) > 1 ? 1 : (currentAlpha + additionalAlpha)
            if resultAlpha < 0 { resultAlpha = 0 }
            if resultAlpha > 1 { resultAlpha = 1 }
            
            var resultHue = currentHue + hue
            if resultHue < 0 { resultHue = 0 }
            if resultHue > 360 { resultHue = 360 }
            
            return UIColor(h: Int(currentHue + hue),
                           s: Int(resultSaturation),
                           b: Int(resultBrightness),
                           alpha: (resultAlpha))
        } else {
            return self
        }
    }
}

@available(iOS 14, *)
extension UIColor {
    public var color: Color {
        Color(self)
    }
}
#endif
