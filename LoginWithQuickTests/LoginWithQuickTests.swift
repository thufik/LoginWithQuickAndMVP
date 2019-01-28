//
//  LoginWithQuickTests.swift
//  LoginWithQuickTests
//
//  Created by EquipeSuporteAplicacao on 6/14/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import XCTest
@testable import LoginWithQuick

class LoginWithQuickTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfLoginWithInvalidCredentialsShouldShowErrorMessage() {
        let loginMock = LoginViewProtocolMock()
        let loginManager = LoginManager(loginViewDelegate: loginMock)
        
        loginManager.requestToAcessTheSystem()
        
        XCTAssert(loginMock.showErrorWasCalled == true)
    }
    
    
}

class LoginViewProtocolMock: NSObject, LoginViewProtocol {
    
    var showErrorWasCalled = false
    var showWelcomeScreenWasCalled = false
    
    func showError() {
        showErrorWasCalled = true
    }
    
    func showWelcomeScreen() {
        showWelcomeScreenWasCalled = true
    }
}
