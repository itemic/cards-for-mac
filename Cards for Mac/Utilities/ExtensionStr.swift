//
//  ExtensionStr.swift
//  Cards for Mac
//
//  Created by Terran Kroft on 1/6/21.
//

import Foundation

extension String {
    var iconify: String {
        let letters = NSCharacterSet.letters
        let pre = "\(self.first!)"
        if pre.rangeOfCharacter(from: letters) != nil {
            return "\(pre).circle".lowercased()
        }
        return "circle"
    }
}
