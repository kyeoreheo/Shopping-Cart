//
//  ShoppingCartTests.swift
//  ShoppingCartTests
//
//  Created by Kyo on 3/11/21.
//

import XCTest
@testable import ShoppingCart

class AuthenticationSignUpTests: XCTestCase {
    var viewModel: SignUpVM?
    
    override func setUpWithError() throws {
        viewModel = SignUpVM()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSignUpViewModelInitialzation() throws {
        XCTAssertNotNil(viewModel, "❌SignUpVM is emtpy")
    }
    
    func testIsValidUserName() throws {
        guard let viewModel = viewModel else { return }
        let testName = "Test Name"
        let testName2 = ""
        viewModel.fullName = testName
        XCTAssertEqual(viewModel.fullName, testName, "❌SignUpVM fullName- is not the same")
        
        XCTAssertTrue(viewModel.isVaildUserName, "❌SignUpVM isValidUserName- \(testName) is not valid")
        
        viewModel.fullName = testName2
        XCTAssertFalse(viewModel.isVaildUserName, "❌SignUpVM isValidUserName- \(testName2) is valid")
    }
    
    func testIsValidPassword() throws {
        guard let viewModel = viewModel else { return }
        let testPassword = "1234"
        let testPassword2 = "12"
        viewModel.password = testPassword
        XCTAssertEqual(viewModel.password, testPassword, "❌SignUpVM password- is not the same")
        XCTAssertTrue(viewModel.isValidPassword, "❌SignUpVM isValidPassword- \(testPassword) is not valid")
        viewModel.password = testPassword2
        XCTAssertFalse(viewModel.isValidPassword, "❌SignUpVM isValidPassword- \(testPassword2) is valid")
    }
    
    func testIsValidMobile() throws {
        guard let viewModel = viewModel else { return }
        let testMobile = "12312341234"
        let testMobile2 = "00"
        viewModel.mobile = testMobile
        XCTAssertEqual(viewModel.mobile, testMobile, "❌SignUpVM mobile- is not the same")
        XCTAssertTrue(viewModel.isValidMobile, "❌SignUpVM isValidMobile- \(testMobile) is not valid")
        viewModel.mobile = testMobile2
        XCTAssertFalse(viewModel.isValidMobile, "❌SignUpVM isValidMobile- \(testMobile2) is valid")

    }

}
