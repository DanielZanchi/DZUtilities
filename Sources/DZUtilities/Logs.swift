//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 22/07/22.
//

import Foundation

public func DZError(_ text: String?, error: Error?, line: Int = #line, function: String = #function) {
#if DEBUG
	print("🔴🔴🔴 - \(text ?? ""): \(error?.localizedDescription ?? "") \n\n \(error) \n\n - in \(function) at \(line)")
#endif
}

public func DZError(_ text: String? = nil, line: Int = #line, function: String = #function) {
#if DEBUG
    print("🔴🔴🔴 - \(text ?? "") - in \(function) at \(line)")
#endif
}

public func DZLog(_ text: Any?, line: Int = #line, function: String = #function) {
#if DEBUG
    print("🟡🟡🟡 - \(text ?? "") - in \(function) at \(line)")
#endif
}
