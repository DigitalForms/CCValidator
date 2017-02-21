//
//  String+RemoveCharacters.swift
//  Pods
//
//  Created by Mariusz Wisniewski on 17.02.2017.
//  Digital Forms
//

import Foundation

// MARK: NSString+RemoveCharacters
public extension String {
    
    public func removingCharactersInSet(_ set: CharacterSet) -> String {
        // solution from: http://stackoverflow.com/a/32927899/4508436
        let stringParts = self.components(separatedBy: set)
        let notEmptyStringParts = stringParts.filter { text in
            text.isEmpty == false
        }
        let result = notEmptyStringParts.joined(separator: "")
        return result
    }
    
    public func removingWhitespaceAndNewlines() -> String {
        return self.removingCharactersInSet(CharacterSet.whitespacesAndNewlines)
    }
}
