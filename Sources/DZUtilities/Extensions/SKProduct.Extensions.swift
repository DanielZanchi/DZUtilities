//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 11/02/22.
//

import StoreKit

extension SKProduct {
    public func yearlyPricePerWeek() -> String? {
        let priceDouble = price.doubleValue
        let doublePerWeek = NSNumber(value: priceDouble / 52.143)
        let formatter = NumberFormatter()
        formatter.locale = priceLocale
        formatter.numberStyle = .currency
        let weeklyPriceString = formatter.string(from: doublePerWeek)
        return weeklyPriceString
    }
    
    public func monthlyPricePerWeek() -> String? {
        let priceDouble = price.doubleValue
        let doublePerWeek = NSNumber(value: priceDouble / 4.3452)
        let formatter = NumberFormatter()
        formatter.locale = priceLocale
        formatter.numberStyle = .currency
        let weeklyPriceString = formatter.string(from: doublePerWeek)
        return weeklyPriceString
    }
}
