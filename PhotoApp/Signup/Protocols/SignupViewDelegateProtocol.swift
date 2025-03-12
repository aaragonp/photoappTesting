//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 1/2/25.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
