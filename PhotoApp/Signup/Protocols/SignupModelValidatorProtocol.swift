//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 26/1/25.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isEmailValid(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
