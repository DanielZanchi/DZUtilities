//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 14/12/21.
//

import Foundation
import CoreGraphics

extension CGFloat {
    public var float: Float {
        return Float(self)
    }
}

extension Int {
    public var string: String {
        return "\(self)"
    }
}

extension String {
    public var integer: Int? {
        return Int(self)
    }
}

extension Int {
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    public var float: Float {
        return Float(self)
    }
}
