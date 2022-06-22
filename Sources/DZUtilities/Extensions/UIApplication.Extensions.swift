//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 03/02/22.
//

import UIKit

extension UIApplication {
    
    public var getKeywindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .first(where: { $0 is UIWindowScene })
                .flatMap({ $0 as? UIWindowScene })?.windows
                .first(where: \.isKeyWindow)
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
}

@available(iOS 13.0, *)
extension UIApplication {
    public var currentWindowScene: UIWindowScene? {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .first(where: { $0 is UIWindowScene })
                .flatMap({ $0 as? UIWindowScene })
    }
}
