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

extension UIApplication {
    
    public var rootViewController: UIViewController? {
        guard let keyWindow = UIApplication.shared.getKeywindow, let rootViewController = keyWindow.rootViewController else {
            return nil
        }
        return rootViewController
    }
    
    public func topViewController(controller: UIViewController? = UIApplication.shared.rootViewController) -> UIViewController? {

        if controller == nil {
            return topViewController(controller: rootViewController)
        }
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let tabController = controller as? UITabBarController {
            if let selectedViewController = tabController.selectedViewController {
                return topViewController(controller: selectedViewController)
            }
        }

        if let presentedViewController = controller?.presentedViewController {
            return topViewController(controller: presentedViewController)
        }

        return controller
    }
    
}
