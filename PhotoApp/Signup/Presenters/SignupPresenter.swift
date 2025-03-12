//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 26/1/25.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?

    required init(formModelValidator: SignupModelValidatorProtocol,
         webService webservice: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }

    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }

        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: SignupError.invalidLastName)
            return
        }

        if !formModelValidator.isEmailValid(email: formModel.email){
            delegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }

        if !formModelValidator.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }

        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            delegate?.errorHandler(error: SignupError.passwordDoNotMatch)
            return
        }

        let requestModel = SignupFormRequestModel(firstName: formModel.firstName,
                                                  lastName: formModel.lastName,
                                                  email: formModel.email,
                                                  password: formModel.password)
        webservice.signup(withForm: requestModel) { [weak self] responseModel, error in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }

            if let _ = responseModel {
                self?.delegate?.successfullSignup()
            }
        }
    }
}
