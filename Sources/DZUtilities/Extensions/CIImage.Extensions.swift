//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 23/02/22.
//

import CoreImage

extension CIImage {
    public func resizeToSameSize(as anotherImage: CIImage) -> CIImage {
        let size1 = extent.size
        let size2 = anotherImage.extent.size
        let transform = CGAffineTransform(scaleX: size2.width / size1.width, y: size2.height / size1.height)
        return transformed(by: transform)
    }
    
    public func resizeToSameSize(as size: CGSize) -> CIImage {
        let size1 = extent.size
        let size2 = size
        let transform = CGAffineTransform(scaleX: size2.width / size1.width, y: size2.height / size1.height)
        return transformed(by: transform)
    }

    public func createCGImage() -> CGImage {
        let context = CIContext(options: nil)
        guard let cgImage = context.createCGImage(self, from: extent) else { fatalError() }
        return cgImage
    }
}

extension CIImage {
    
    public func mask(with maskImage: CIImage) -> CIImage? {
        guard let filter = CIFilter(name: "CIBlendWithMask", parameters: [
            kCIInputImageKey: self,
            kCIInputMaskImageKey: maskImage]) else { return nil }
        return filter.outputImage
    }
    
}
