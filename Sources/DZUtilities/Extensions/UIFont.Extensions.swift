//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 04/04/22.
//
#if canImport(UIKit)
import UIKit

public extension UIFont {
	class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
		let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
		
		guard #available(iOS 13.0, *), let descriptor = systemFont.fontDescriptor.withDesign(.rounded) else { return systemFont }
		return UIFont(descriptor: descriptor, size: size)
	}
}
#endif
