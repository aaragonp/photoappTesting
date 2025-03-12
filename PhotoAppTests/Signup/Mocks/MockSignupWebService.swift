//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Alberto Aragón Peci on 26/1/25.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false

    func signup(withForm formModel: PhotoApp.SignupFormRequestModel, completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        isSignupMethodCalled = true

        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
}
