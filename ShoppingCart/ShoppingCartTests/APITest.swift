//
//  APITest.swift
//  ShoppingCartTests
//
//  Created by Kyo on 3/15/21.
//

import XCTest
@testable import ShoppingCart

class APITest: XCTestCase {
    var api: API?

    override func setUpWithError() throws {
        api = API.shared
    }

    override func tearDownWithError() throws {
        api = nil
    }

    func testSignUpSuccess() throws {
        guard let api = api else { return }
        let body: [String : Any] = [
            "name": "testName",
            "email": "test@test.test",
            "mobile": "12312341234",
            "password": "0000",
        ]
        
        api.registerUesr(body: body) { response in
            XCTAssertEqual(response, "SUCCESS")
            XCTAssertNotNil(response, "❌ API register- is nil")
        }
    }
    
    func testSignUpFail() throws {
        guard let api = api else { return }
        let body: [String : Any] = [
            "name": "testName"
        ]
        
        api.registerUesr(body: body) { response in
            XCTAssertEqual(response, "SUCCESS")
            XCTAssertNotNil(response, "❌ API register- is nil")
        }
    }
    
    func testLogInSuccess() throws {
        guard let api = api else { return }
        let expectation = self.expectation(description: "Expects reponse is not nil")

        let body: [String : Any] = [
            "mobile": "12312341234",
            "password": "0000",
        ]
        
        api.logIn(body: body) { response in
            XCTAssertNotNil(response, "❌ API logIn- is nil")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 20)
    }
    
    func testLogInFail() throws {
        guard let api = api else { return }
        let expectation = self.expectation(description: "Expects reponse is not nil")

        let body: [String : Any] = [
            "mobile": "12312341234"
        ]
        
        api.logIn(body: body) { response in
            XCTAssertNotNil(response, "❌ API logIn- is not nil")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 20)
    }

}
