//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 26/11/24.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true

        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }

    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true

        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        return returnValue
    }

    func isEmailValid(email: String) -> Bool {
        var returnValue = true

        if !email.isEmpty {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            returnValue = emailPredicate.evaluate(with: email)
        } else {
            returnValue = false
        }

        return returnValue
    }

    func isPasswordValid(password: String) -> Bool {
        !password.isEmpty
    }

    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        password == repeatPassword
    }
}
