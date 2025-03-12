//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Alberto Aragón Peci on 6/2/25.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled: Bool = false

    required init(formModelValidator: any PhotoApp.SignupModelValidatorProtocol, webService: any PhotoApp.SignupWebServiceProtocol, delegate: any PhotoApp.SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}
