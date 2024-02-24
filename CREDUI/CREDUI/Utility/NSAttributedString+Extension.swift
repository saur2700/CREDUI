//
//  NSAttributedString+Extension.swift
//  CREDUI
//
//  Created by Saurav Kumar on 24/02/24.
//

import UIKit

extension NSAttributedString {
    static func withAttributes(_ text: String, color: UIColor, fontSize: CGFloat, weight: UIFont.Weight) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
}
