//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 23/11/21.
//

import Foundation

extension String {
    
    static public func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    public func localized(variables: [CVarArg]) -> String {
        return String(format: self.localized, arguments: variables)
    }
}
