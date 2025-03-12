//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 6/2/25.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
