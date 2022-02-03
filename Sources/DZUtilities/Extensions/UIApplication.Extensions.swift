//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 03/02/22.
//

import UIKit

extension UIApplication {
    
    public var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
}