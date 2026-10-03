//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 03/10/26.
//

import Testing

@testable import IndianIDValidatorKit

@Test func packageBuilds() {
    #expect(true)
}


@Test func validIsValid() {
    #expect(ValidationResult.valid.isValid)
}

@Test func invalidIsNotValid() {
    #expect(!ValidationResult.invalid(.empty).isValid)
}
