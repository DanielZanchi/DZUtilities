//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 23/12/21.
//

import UIKit

extension NSLayoutConstraint {
    @discardableResult
    public func change(multiplier: CGFloat) -> NSLayoutConstraint {
        if let firstItem = firstItem {
            let newConstraint = NSLayoutConstraint(item: firstItem,
                                                   attribute: firstAttribute,
                                                   relatedBy: relation,
                                                   toItem: secondItem,
                                                   attribute: secondAttribute,
                                                   multiplier: multiplier,
                                                   constant: constant)
            
            newConstraint.priority = self.priority
            
            NSLayoutConstraint.deactivate([self])
            NSLayoutConstraint.activate([newConstraint])
            return newConstraint
        }
        return self
    }
}
