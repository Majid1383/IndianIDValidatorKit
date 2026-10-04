//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Foundation

public struct UPIIDValidator : Sendable {
    
    public init() {}
    
    public func validate(_ input: String) -> ValidationResult {
        let value = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !value.isEmpty else {return .invalid(.empty)}
        
        //Exactly one "@" give exactly two parts
        let parts = value.split(separator: "@", omittingEmptySubsequences: false)
        guard parts.count == 2 else {return .invalid(.invalidFormat)}
        
        
        let name = parts[0]
        let handle = parts[1]
        guard name.count >= 2, handle.count >= 2 else {return .invalid(.invalidFormat)}
        
        let nameIsValid = name.allSatisfy({$0.isASCII && ($0.isLetter || $0.isNumber || $0 == "." || $0 == "-" || $0 == "_")})
        
        let handleIsValid = handle.allSatisfy({$0.isASCII && $0.isLetter})
        
        guard nameIsValid, handleIsValid else { return .invalid(.invalidCharacters) }
        
        return .valid
    }
}
