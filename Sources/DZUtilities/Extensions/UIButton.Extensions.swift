//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 18/11/22.
//

import UIKit

extension UIButton {
    public func underlineText() {
        guard let title = title(for: .normal) else { return }
        
        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(titleString, for: .normal)
    }
}
