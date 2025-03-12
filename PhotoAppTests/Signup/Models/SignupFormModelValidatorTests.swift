//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Alberto Aragón Peci on 26/11/24.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // MARK: - First name tests

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Alberto")

        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }

    func testSingupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "A")

        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but returned TRUE")
    }

    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Asjdfksjhdfksjhdfksjdhfksdjhf")

        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but returned TRUE")
    }

    // MARK: - Last name tests

    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Aragon")

        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }

    func testSingupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "A")

        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but returned TRUE")
    }

    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Asjdfksjhdfksjhdfksjdhfksdjhf")

        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but returned TRUE")
    }

    // MARK: - Email tests

    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "aaragon@aaragon.com")

        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email but returned FALSE")
    }

    func testSignupFormModelValidator_WhenNotValidEmailProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "aaragon")

        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a not valid email but returned TRUE")
    }

    func testSignupFormModelValidator_WhenEqualPasswordsProvidedShouldReturnTrue() {
        // Act
        let doPasswordsPatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "12345678")

        // Assert
        XCTAssertTrue(doPasswordsPatch, "The doPasswordsMatch() should have returned TRUE for equal passwords but returned FALSE")
    }

    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsPatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234678")

        XCTAssertFalse(doPasswordsPatch, "The doPasswordsMatch() should have returned FALSE for not matching passwords but returned TRUE")
    }
}
