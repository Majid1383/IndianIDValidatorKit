//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Testing
@testable import IndianIDValidatorKit

struct PINCodeValidatorTests {
    let validator = PINCodeValidator()

    @Test(arguments: ["400001", " 110001 "])
    func accepts(input: String) {
        #expect(validator.validate(input) == .valid)
    }

    @Test func rejectsEmpty() {
        #expect(validator.validate("") == .invalid(.empty))
    }

    @Test func rejectsWrongLength() {
        #expect(validator.validate("40001") == .invalid(.wrongLength(expected: 6, actual: 5)))
    }

    @Test func rejectsLeadingZero() {
        #expect(validator.validate("012345") == .invalid(.invalidFormat))
    }

    @Test(arguments: ["4000a1", "४००००१"])
    func rejectsBadCharacters(input: String) {
        #expect(validator.validate(input) == .invalid(.invalidCharacters))
    }
}
