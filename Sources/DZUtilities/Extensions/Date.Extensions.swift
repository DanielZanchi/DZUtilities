//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 14/12/21.
//

import Foundation

extension Date {
    /**
     Returns a string with the format "dd-MM-yyyy", or edit the format
     */
    public func getString(format: String = "dd-MM-yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        
        return dateFormatter.string(from: self)
    }
}

