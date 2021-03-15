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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUP() throws {
        let body: [String : Any] = [
            "name": "testName",
            "email": "test@test.test",
            "mobile": "12312341234",
            "password": "0000",
        ]
        
        api?.registerUesr(body: body) { response in
            XCTAssertEqual(response, "SUCCESS")
            XCTAssertNotNil(response, "❌ API register- is nil")
        }
    }
    
    func testLogIn() throws {
        let body: [String : Any] = [
            "mobile": "12312341234",
            "password": "0000",
        ]
        
        api?.logIn(body: body) { response in
            XCTAssertNotNil(response, "❌ API logIn- is nil")
        }
    }

}
