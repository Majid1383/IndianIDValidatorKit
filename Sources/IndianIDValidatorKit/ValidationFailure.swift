//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 03/10/26.
//

import Foundation

public enum ValidationFailure: Sendable, Equatable {
    case empty
    case wrongLength(expected: Int, actual: Int)
    case invalidCharacters
    case invalidFormat
}
