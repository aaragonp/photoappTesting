//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 1/2/25.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel,
                completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
