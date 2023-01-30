//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 20/05/22.
//

#if canImport(UIKit)
extension UIImage {
    
    public func resize(to newSize: CGSize, scale: CGFloat? = nil, quality: CGInterpolationQuality = .default) -> UIImage {
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = scale ?? self.scale
        let renderer = UIGraphicsImageRenderer(size: newSize, format: format)
        let image = renderer.image { context in
            context.cgContext.interpolationQuality = quality
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }
        return image
    }
    
    public func getNewSize(withLongestLenghtOf longest: CGFloat) -> CGSize {
        if longest > self.size.width && longest > self.size.height {
            return self.size
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
        return newSize
    }
    
    public func resizedImage(withLongestLenghtOf longest: CGFloat, scale: CGFloat? = nil, quality: CGInterpolationQuality = .default) -> UIImage {

        let newSize = getNewSize(withLongestLenghtOf: longest)
        
        return resize(to: newSize, scale: scale, quality: quality)
    }
    
}
#endif
