//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Alberto Aragón Peci on 26/1/25.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordEqualityValidated: Bool = false

    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }

    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }

    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
}
