//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 09/02/23.
//
#if canImport(UIKit)
import UIKit

extension UIViewController {
	
	public func addViewController(_ viewController: UIViewController, inView view: UIView){
		viewController.willMove(toParent: self)
		viewController.view.frame = view.bounds
		view.addSubview(viewController.view)
		self.addChild(viewController)
		viewController.didMove(toParent: self)
	}
	
}
