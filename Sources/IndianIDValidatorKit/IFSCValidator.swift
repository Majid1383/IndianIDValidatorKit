//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Foundation


public struct IFSCValidator : Sendable , Equatable {
    
    private static let length = 11
    
    public init() {}
    
    public func validate(_ input: String) -> ValidationResult {
        
        let value = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()
        
        guard !value.isEmpty else {return .invalid(.empty)}
        
        let characters = Array(value)
        
        guard characters.count == Self.length else {
            return .invalid(.wrongLength(expected: Self.length , actual: characters.count))
        }
        
        guard characters.allSatisfy({$0.isASCII && ($0.isLetter || $0.isNumber)}) else {return .invalid(.invalidCharacters)}
        
        let bankCodeIsLetters = characters[0..<4].allSatisfy { $0.isLetter }
        
        guard bankCodeIsLetters, characters[4] == "0" else {
            return .invalid(.invalidFormat)
        }
        
        return .valid
    }
}
