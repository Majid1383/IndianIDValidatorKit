//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Testing

@testable import IndianIDValidatorKit

struct PANValidatorTests {
    
    let validator = PANValidator()
    
    @Test(arguments: ["ABCDE1234F", "abcde1234f", "  ABCDE1234F  "])
    func accepts(input: String){
        #expect(validator.validate(input) == .valid)
    }
    
    @Test func rejectEmpty() {
        #expect(validator.validate("") == .invalid(.empty))
        #expect(validator.validate("  ") == .invalid(.empty))
    }
    
    @Test func rejectsWrongLength() {
        #expect(validator.validate("ABCDE123") == .invalid(.wrongLength(expected: 10, actual: 8)))
    }
    
    @Test(arguments: ["1BCDE1234F", "ABCDE12345", "ABCDEA234F"])
    func rejectsBadPattern(input: String) {
        #expect(validator.validate(input) == .invalid(.invalidFormat))
    }
    
    @Test(arguments: ["ABCDE-234F", "ABCDE१२३४F"])
    func rejectsBadCharacters(input: String) {
        #expect(validator.validate(input) == .invalid(.invalidCharacters))
    }
    
}
