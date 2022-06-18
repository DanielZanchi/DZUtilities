//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 20/05/22.
//

import UIKit

extension UIImage {
    
    public func resize(to newSize: CGSize) {
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let image = renderer.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }
        return image
    }
    
    public func resizedImage(withLongestLenghtOf longest: CGFloat) -> UIImage {
        if longest > self.size.width && longest > self.size.height {
            return self
        }
        
        var factor: CGFloat
        if self.size.width > self.size.height {
            factor = longest / self.size.width
        } else {
            factor = longest / self.size.height
        }
        
        let newWidth = factor * self.size.width
        let newHeight = factor * self.size.height
        
        let newSize = CGSize(width: Int(newWidth), height: Int(newHeight))
        
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: newSize, format: format)
        let image = renderer.image { _ in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return image
    }
    
}
