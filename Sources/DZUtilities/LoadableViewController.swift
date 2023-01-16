//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 16/01/23.
//

import UIKit

open class LoadableViewController: UIViewController {
	
	private static func nibName() -> String {
		return String(describing: self)
	}
	
	public init() {
		super.init(nibName: Self.nibName(), bundle: nil)
	}
	
	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
