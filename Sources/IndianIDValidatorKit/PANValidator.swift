//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 03/10/26.
//

import Foundation

public struct PANValidator : Sendable {
    
    private static let length = 10
    
    public init() {}
    
    public func validate(_ input: String) -> ValidationResult {
        //1. Normalize
        let value = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()
        
        //2.Empty Check
        guard !value.isEmpty else {return .invalid(.empty)}
        
        //3.Length
        let characters = Array(value)
        guard characters.count == Self.length else {
            return .invalid(.wrongLength(expected: Self.length, actual: characters.count))
        }
        
        //4.Only ASCII letters and digits
        guard characters.allSatisfy({ $0.isASCII && ($0.isLetter || $0.isNumber)}) else {return .invalid(.invalidCharacters)}
        
        //5.Pattern: 5 Letters, 4 digits, 1 Letter
        for (index,character) in characters.enumerated() {
            let expectsDigit = (5...8).contains(index)
            if expectsDigit != character.isNumber {
                return .invalid(.invalidFormat)
            }
        }
        
        return .valid
    }
}
