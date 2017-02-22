//
//  CreditCardPrefix.swift
//  Pods
//
//  Created by Mariusz Wisniewski on 17.02.2017.
//  Digital Forms
//

import Foundation


/// Credit Card type prefix specification. Describes how long is credit card prefix 
/// (how many digits) and what is the prefix range start, end and prefix length.
public class CreditCardPrefix {
    
    /// Credit Card type prefix starting range
    public let rangeStart: Int
    
    /// Credit Card type prefix ending range
    public let rangeEnd: Int
    
    /// Credit Card type prefix length
    public let prefixLength: Int
    
    
    /// Initialize CreditCardPrefix instance with information about prefix range
    /// start, end and length
    ///
    /// - Parameters:
    ///   - rangeStart: Start of prefix range. E.g. if given card type can have 
    ///                 beginnings from 51 to 55, rangeStart would be 51
    ///   - rangeEnd: End of prefix range. E.g. if given card type can have 
    ///               beginnings from 51 to 55, rangeEnd would be 55
    ///   - length: Length of credit card type prefix. E.g. if given card can 
    ///             have beginnings from 51 to 55, length would be 2 (two digits)
    public init(rangeStart: Int, rangeEnd: Int, length: Int) {
        self.rangeStart = rangeStart
        self.rangeEnd = rangeEnd
        self.prefixLength = length
    }
}
