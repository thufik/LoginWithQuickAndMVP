//
//  LoginQuick.swift
//  LoginWithQuickTests
//
//  Created by EquipeSuporteAplicacao on 6/14/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Nimble
import Quick
import UIKit
@testable import LoginWithQuick

class LoginQuick: QuickSpec {
    
    
    func showWelcomeScreen() -> Predicate<LoginViewProtocolMock>{
        return Predicate{ expression in
            
            guard let loginViewProtocol = try expression.evaluate() else{
                return PredicateResult(status: .fail, message: .fail("failed evaluating expression"))
            }
            
            guard loginViewProtocol.showWelcomeScreenWasCalled == true else{
                return PredicateResult(status: .fail, message: .fail("failed evaluating expression"))
            }
            
            return PredicateResult(status: .matches, message: .expectedTo("Expectation fulfilled"))
        }
    }
    
    var loginViewDelegate : LoginViewProtocolMock!
    var loginManager : LoginManager!
    
    override func spec() {
        context("Click to Login", {
            
            self.loginViewDelegate = LoginViewProtocolMock()
            self.loginManager = LoginManager(loginViewDelegate: self.loginViewDelegate)
            
            describe("With valid credentials",  {
                
                self.loginManager.requestToAcessTheSystem()
                
                it("should show welcome screen") {
                    expect(self.loginViewDelegate).to(self.showWelcomeScreen())
                }
                
            })
            
        })
    }

}
