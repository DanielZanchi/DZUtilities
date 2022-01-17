//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 17/01/22.
//

import UIKit

extension UIScrollView {
    
    enum ScrollType { case horizontal, vertical }
    
    public func showOff(scrollType: ScrollType, startDelay: Double = 0.6, backDelay: Double = 0.6) {
        DispatchQueue.main.asyncAfter(deadline: .now() + startDelay) {
            switch scrollType {
            case .horizontal:
                let bottomOffset = CGPoint(x: self.bottomViewScrollView.contentSize.width - self.bottomViewScrollView.bounds.width + self.bottomViewScrollView.contentInset.right, y: 0)
                self.bottomViewScrollView.setContentOffset(bottomOffset, animated: true)
            case .vertical:
                let bottomOffset = CGPoint(x: 0, y: self.bottomViewScrollView.contentSize.height - self.bottomViewScrollView.bounds.height + self.bottomViewScrollView.contentInset.bottom)
                self.bottomViewScrollView.setContentOffset(bottomOffset, animated: true)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + backDelay) {
                let topOffset = CGPoint(x: 0, y: 0)
                self.bottomViewScrollView.setContentOffset(topOffset, animated: true)
            }
        }
    }
    
}
