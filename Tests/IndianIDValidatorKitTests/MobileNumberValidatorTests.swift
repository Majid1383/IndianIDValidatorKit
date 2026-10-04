//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//


import Testing
@testable import IndianIDValidatorKit

struct MobileNumberValidatorTests {
    let validator = MobileNumberValidator()

    @Test(arguments: ["9876543210", "+919876543210", "+91 98765 43210",
                      "919876543210", "09876543210", "98765-43210"])
    func accepts(input: String) {
        #expect(validator.validate(input) == .valid)
    }

    @Test func rejectsEmpty() {
        #expect(validator.validate("") == .invalid(.empty))
        #expect(validator.validate("   ") == .invalid(.empty))
    }

    @Test func rejectsWrongLength() {
        #expect(validator.validate("98765") == .invalid(.wrongLength(expected: 10, actual: 5)))
        #expect(validator.validate("98765432101") == .invalid(.wrongLength(expected: 10, actual: 11)))
    }

    @Test func rejectsBadFirstDigit() {
        #expect(validator.validate("5876543210") == .invalid(.invalidFormat))
    }

    @Test(arguments: ["98765abcde", "98765.43210"])
    func rejectsBadCharacters(input: String) {
        #expect(validator.validate(input) == .invalid(.invalidCharacters))
    }
}
