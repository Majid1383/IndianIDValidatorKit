//
//  File.swift
//  IndianIDValidatorKit
//
//  Created by Abdul Majid Shaikh on 03/10/26.
//

import Foundation

public enum ValidationResult : Sendable, Equatable {
    case valid
    case invalid(ValidationFailure)
    
    public var isValid : Bool {
        if case .valid = self { return true }
        return false
    }
    
    
}
