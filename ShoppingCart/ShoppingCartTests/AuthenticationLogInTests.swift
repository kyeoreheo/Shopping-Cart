//
//  AuthenticationLogInVMTests.swift
//  ShoppingCartTests
//
//  Created by Kyo on 3/15/21.
//

import XCTest
@testable import ShoppingCart

class AuthenticationLogInTests: XCTestCase {
    var viewModel: LogInVM?

    override func setUpWithError() throws {
        viewModel = LogInVM()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testIsValidForm() throws {
        guard let viewModel = viewModel else { return }
        viewModel.password = "0000"
        viewModel.mobile = "12312341234"
        XCTAssertTrue(viewModel.isValidForm, "❌LogInVM isValidForm- did not valified validForm" )
        viewModel.password = ""
        XCTAssertFalse(viewModel.isValidForm, "❌LogInVM isValidForm- is not working" )

    }
    
    func testShouldActiveButton() throws {
        guard let viewModel = viewModel else { return }
        viewModel.password = "0000"
        viewModel.mobile = "12312341234"
        XCTAssertTrue(viewModel.shouldActiveButton, "❌LogInVM shouldActiveButton- did not valified shouldActiveButton" )
        viewModel.password = ""
        XCTAssertFalse(viewModel.shouldActiveButton, "❌LogInVM shouldActiveButton- is not working" )
        
    }

}
