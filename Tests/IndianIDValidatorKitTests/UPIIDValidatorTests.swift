//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 04/10/26.
//

import Testing
@testable import IndianIDValidatorKit

struct UPIIDValidatorTests {
    let validator = UPIIDValidator()

    @Test(arguments: ["majid@oksbi", "majid.shaikh-1@ybl", "9876543210@paytm", " user_name@okaxis "])
    func accepts(input: String) {
        #expect(validator.validate(input) == .valid)
    }

    @Test func rejectsEmpty() {
        #expect(validator.validate("") == .invalid(.empty))
    }

    @Test(arguments: ["majid", "majid@", "@ybl", "a@ybl", "majid@ok@axis"])
    func rejectsBadStructure(input: String) {
        #expect(validator.validate(input) == .invalid(.invalidFormat))
    }

    @Test(arguments: ["maj id@ybl", "majid@yb1", "majid!@ybl"])
    func rejectsBadCharacters(input: String) {
        #expect(validator.validate(input) == .invalid(.invalidCharacters))
    }
}
