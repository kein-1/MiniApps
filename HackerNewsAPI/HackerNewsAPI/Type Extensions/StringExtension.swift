//
//  StringExtension.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/16/24.
//

import Foundation

// Credit: https://forums.developer.apple.com/forums/thread/677823
extension String {
    
    /// Used to parse the HTML returned string
    /// - Returns: A cleaned string
    func htmlToString() -> String {
        return  try! NSAttributedString(data: self.data(using: .utf8)!,
                                        options: [.documentType: NSAttributedString.DocumentType.html],
                                        documentAttributes: nil).string
    }
}
