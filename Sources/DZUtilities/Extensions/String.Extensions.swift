//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 23/11/21.
//

import Foundation

extension String {
	
	public enum RandomType { case full, onlyLetters, onlyLowercasedLetters, onlyUppercasedLetters }
	
	static public func randomString(length: Int, randomType: RandomType = .full) -> String {
		var letters = ""
		switch randomType {
		case .full:
			letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		case .onlyLetters:
			letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		case .onlyLowercasedLetters:
			letters = "abcdefghijklmnopqrstuvwxyz"
		case .onlyUppercasedLetters:
			letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		}
		
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
