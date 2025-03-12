//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 1/12/24.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
