//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Testing

@testable import IndianIDValidatorKit

struct IFSCValidatorTests {
    
    let validator = IFSCValidator()
    
    @Test(arguments: ["SBIN0001234", "hdfc0000001", "  SBIN0001234  "])
    func accepts(input: String) {
        #expect(validator.validate(input) == .valid)
    }
    
    @Test func rejectEmpty() {
        #expect(validator.validate("") == .invalid(.empty))
    }
    
    @Test func rejectsWrongLength() {
        #expect(validator.validate("SBIN000123") == .invalid(.wrongLength(expected: 11, actual: 10)))
    }
    
    @Test(arguments: ["SBI10001234", "SBIN1001234"])
    func rejectBadPattern(input: String) {
        #expect(validator.validate(input) == .invalid(.invalidFormat))
    }
    
    @Test func rejectBadCharacters() {
        #expect(validator.validate("SBIN0001-34") == .invalid(.invalidCharacters))
    }   
}
