//
//  LoginManager.swift
//  LoginWithQuick
//
//  Created by EquipeSuporteAplicacao on 6/14/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class LoginManager: NSObject {

    var loginViewDelegate : LoginViewProtocol!
    
    init(loginViewDelegate : LoginViewProtocol) {
        self.loginViewDelegate = loginViewDelegate
    }
    
    func requestToAcessTheSystem(){
        self.loginViewDelegate.showWelcomeScreen()
    }
}
