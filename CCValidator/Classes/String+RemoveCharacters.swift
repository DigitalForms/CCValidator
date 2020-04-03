//
//  String+RemoveCharacters.swift
//  Pods
//
//  Created by Mariusz Wisniewski on 17.02.2017.
//  Digital Forms
//

import Foundation

// MARK: NSString+RemoveCharacters

/// String extension with helper methods for removing characters in given set
/// from start, end and inside the string (whereas standard trimming removes
/// characters only from start and end of the String.
public extension String {
    
    /// Remove characters from given set from the string. Looks for characters 
    /// from set in the whole string, not only its beginning and end.
    ///
    /// - Parameter set: Character set, with characters we want to remove
    /// - Returns: New String with characters from given set removed
    func removingCharactersInSet(_ set: CharacterSet) -> String {
        // solution from: http://stackoverflow.com/a/32927899/4508436
        let stringParts = self.components(separatedBy: set)
        let notEmptyStringParts = stringParts.filter { text in
            text.isEmpty == false
        }
        let result = notEmptyStringParts.joined(separator: "")
        return result
    }
    
    
    /// Remove whitespace and newlines characters from the string. Looks for 
    /// characters from set in the whole string, not only its beginning and end.
    ///
    /// - Returns: New String with whitespace and newline characters removed
    func removingWhitespaceAndNewlines() -> String {
        return self.removingCharactersInSet(CharacterSet.whitespacesAndNewlines)
    }
}
