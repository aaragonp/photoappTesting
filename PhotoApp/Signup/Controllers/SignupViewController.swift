//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Alberto Aragón Peci on 1/2/25.
//

import UIKit

class SignupViewController: UIViewController {
    var signupPresenter: SignupPresenterProtocol?

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let signupWebService = SignupWebService(urlString: SignupConstants.signupUrlString)
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webService: signupWebService, delegate: self)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "",
                                              lastName: lastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "")

        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignup() {
        let alert = UIAlertController(title: "Success",
                                      message: "The signup operation was successful",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error",
                                      message: "Your request could not be processed at this time",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true)
        }
    }
}
