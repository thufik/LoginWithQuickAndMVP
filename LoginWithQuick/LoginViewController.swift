//
//  ViewController.swift
//  LoginWithQuick
//
//  Created by EquipeSuporteAplicacao on 6/14/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func acessSystem(_ sender: UIButton) {
        let loginManager = LoginManager(loginViewDelegate : self)
        
        loginManager.requestToAcessTheSystem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showWelcomeScreen"{
            print("Segue passando")
        }
    }
    
}

extension UIViewController : LoginViewProtocol{
    func showError() {
        
    }
    
    func showWelcomeScreen(){
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let welComeScreen = storyBoard.instantiateViewController(withIdentifier: "welcomeScreen")
        
        self.present(welComeScreen, animated: true, completion: nil)
    }
}

