//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Alberto Aragón Peci on 26/11/24.
//

import XCTest
@testable import PhotoApp

final class SignupFlowUITests: XCTestCase {
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var securePassword: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()

        app = XCUIApplication()
        app.launch()

        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        securePassword = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        securePassword = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }

    @MainActor
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        XCTAssertTrue(firstName.isEnabled, "First name TextField is not enabled for user interaction")
        XCTAssertTrue(lastName.isEnabled, "Last name TextField is not enabled for user interaction")
        XCTAssertTrue(email.isEnabled, "Email TextField is not enabled for user interaction")
        XCTAssertTrue(securePassword.isEnabled, "Password TextField is not enabled for user interaction")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password TextField is not enabled for user interaction")
        XCTAssertTrue(signupButton.isEnabled, "The Signup button is not enabled for user interaction")
    }

    func testViewController_WhenInvalidFormSubmitted_PresentErrorAlertDialog() throws {
        // Arrange
        firstName.tap()
        firstName.typeText("S")

        lastName.tap()
        lastName.typeText("K")

        email.tap()
        email.typeText("@")

        securePassword.tap()
        securePassword.typeText("123456")

        repeatPassword.tap()
        repeatPassword.typeText("123")

        let signupButton = app.buttons["signupButton"]

        // Act
        signupButton.tap()

        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1),
                      "An Error Alert dialog was not presented when invalid signup form was submitted")
    }

    func testViewController_WhenValidFormSubmitted_PresentSuccessAlertDialog() throws {
        // Arrange
        firstName.tap()
        firstName.typeText("Sergey")

        lastName.tap()
        lastName.typeText("Kargopolov")

        email.tap()
        email.typeText("test@test.com")

        securePassword.tap()
        securePassword.typeText("12345678")

        repeatPassword.tap()
        repeatPassword.typeText("12345678")

        let signupButton = app.buttons["signupButton"]

        // Act
        signupButton.tap()

        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 5),
                      "An Success Alert dialog was not presented when invalid signup form was submitted")
    }
//
//    @MainActor
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
