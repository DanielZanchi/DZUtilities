//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 20/05/22.
//

import Foundation

extension Data {
    
    public func getSizeInMB() -> String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB]
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(self.count)).replacingOccurrences(of: ",", with: ".")
        return string
    }
    
}
