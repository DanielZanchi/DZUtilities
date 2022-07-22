//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 22/07/22.
//

import Foundation

func DZError(_ text: String, error: Error, line: Int = #line, function: String = #function) {
    #if DEBUG
    print("🔴🔴🔴 - \(text): \(error.localizedDescription) - in \(function) at \(line)")
    #endif
}

func DZError(_ text: String, line: Int = #line, function: String = #function) {
    #if DEBUG
    print("🔴🔴🔴 - \(text) - in \(function) at \(line)")
    #endif
}

func DZLog(_ text: Any, line: Int = #line, function: String = #function) {
    #if DEBUG
    print("🟡🟡🟡 - \(text) - in \(function) at \(line)")
    #endif
}
