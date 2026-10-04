//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Foundation

public struct MobileNumberValidator : Sendable {
    
    private static let length = 10
    
    public init() {}
    
    public func validate(_ input: String) -> ValidationResult {
        //Ignore spaces, newlines and hyphens : "98764 43210", "98765-43210"
        var value = input.filter { !$0.isWhitespace && $0 != "-"}
        
        guard !value.isEmpty else {return .invalid(.empty)}
        
        //Strip an optional country or trunk prefix
        if value.hasPrefix("+91") {
            value.removeFirst(3)
        }else if value.count == 12, value.hasPrefix("91"){
            value.removeFirst(2)
        }else if value.count == 11, value.hasPrefix("0") {
            value.removeFirst(1)
        }
        
        let characters = Array(value)
        
        guard characters.allSatisfy({$0.isASCII && $0.isNumber}) else { return .invalid(.invalidCharacters)}
        guard characters.count == Self.length else {return .invalid(.wrongLength(expected: Self.length, actual: characters.count))}
        guard "6789".contains(characters[0]) else {return .invalid(.invalidFormat)}
        
        return .valid
    }
}
