//
//  CreditCardPrefix.swift
//  Pods
//
//  Created by Mariusz Wisniewski on 17.02.2017.
//  Digital Forms
//

import Foundation

public class CreditCardPrefix {
    let rangeStart: Int
    let rangeEnd: Int
    var prefixLength: Int
    
    init(rangeStart: Int, rangeEnd: Int, length: Int) {
        self.rangeStart = rangeStart
        self.rangeEnd = rangeEnd
        self.prefixLength = length
    }
}
