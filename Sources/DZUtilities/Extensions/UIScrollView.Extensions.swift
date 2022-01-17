//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 17/01/22.
//

import UIKit

extension UIScrollView {
    
    public enum ScrollType { case horizontal, vertical }
    
    public func showOff(scrollType: ScrollType, startDelay: Double = 0.6, backDelay: Double = 0.6) {
        DispatchQueue.main.asyncAfter(deadline: .now() + startDelay) {
            switch scrollType {
            case .horizontal:
                let bottomOffset = CGPoint(x: self.contentSize.width - self.bounds.width + self.contentInset.right, y: 0)
                self.setContentOffset(bottomOffset, animated: true)
            case .vertical:
                let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.height + self.contentInset.bottom)
                self.setContentOffset(bottomOffset, animated: true)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + backDelay) {
                let topOffset = CGPoint(x: 0, y: 0)
                self.setContentOffset(topOffset, animated: true)
            }
        }
    }
    
}
