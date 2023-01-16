//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 16/01/23.
//

import UIKit

public class LoadableViewController: UIViewController {
	
	static func nibName() -> String {
		return String(describing: self)
	}
	
	init() {
		super.init(nibName: Self.nibName(), bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
