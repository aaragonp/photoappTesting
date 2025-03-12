//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Alberto Aragón Peci on 1/2/25.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: SignupError?

    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
}
