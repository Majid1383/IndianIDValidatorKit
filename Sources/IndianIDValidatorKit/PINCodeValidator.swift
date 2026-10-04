//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Foundation

public struct PINCodeValidator : Sendable {
    private static let length = 6
    
    public init() {}
    
    public func validate(_ input : String) -> ValidationResult {
        let value = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !value.isEmpty else {return .invalid(.empty)}
        
        let characters = Array(value)
        
        guard characters.count == Self.length else {
            return .invalid(.wrongLength(expected: Self.length, actual: characters.count))
        }
        
        guard characters.allSatisfy({ $0.isASCII && $0.isNumber}) else {
            return .invalid(.invalidCharacters)
        }
        
        guard characters[0] != "0" else {
            return .invalid(.invalidFormat)
        }
        
        return .valid
    }
}
