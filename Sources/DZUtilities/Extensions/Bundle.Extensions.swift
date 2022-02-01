//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 27/01/22.
//

import Foundation

extension Bundle {
    
    /// Returns: "2.5"?
    public var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Returns: "13"
    public var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    /// Returns:  "2.5(13)"
    public var versionAndBuild: String? {
        let ver: String = (infoDictionary?["CFBundleShortVersionString"] as? String)!
        let build: String = (infoDictionary?["CFBundleVersion"] as? String)!
        let str = ver + "(" + build + ")"
        return str
    }
    
    /// Returns: "2.5"
    public var releaseVersionNumberPretty: String {
        return releaseVersionNumber ?? ""
    }
}
