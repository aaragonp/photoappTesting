//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 12/1/25.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPassword
    case passwordDoNotMatch

    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,
                .invalidRequestURLString,
                .invalidFirstName,
                .invalidLastName,
                .invalidEmail,
                .invalidPassword,
                .passwordDoNotMatch:
            return ""

        }
    }
}
