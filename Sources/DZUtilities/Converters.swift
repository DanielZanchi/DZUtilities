//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 14/12/21.
//

import Foundation
import CoreGraphics

extension CGFloat {
    var float: Float {
        return Float(self)
    }
}

extension Int {
    var string: String {
        return "\(self)"
    }
}

extension String {
    var integer: Int? {
        return Int(self)
    }
}

extension Int {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    var float: Float {
        return Float(self)
    }
}
