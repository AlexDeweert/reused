//
//  ViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-10.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView
    var _emailText: String?
    var _passwordText: String?
    
    var emailText: String? {
        set {self._emailText = newValue}
        get {return self._emailText}
    }
    var passwordText: String? {
        set {self._passwordText = newValue}
        get {return self._passwordText}
    }
    
    required init?(coder: NSCoder) {
        self.loginView = LoginView()
        super.init(coder: coder)
        print("\(String(describing: self)) => required init?(...)")
        fatalError("required init? not implemented in LoginViewController")
    }

    init() {
        self.loginView = LoginView()
        super.init(nibName: nil, bundle: nil)
        print("\(String(describing: self)) => init()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.view.addSubview(self.loginView)
        self.view = self.loginView
        print("\(String(describing: self)) => viewDidLoad()")
    }
}

//Delegate functions for selectors in LoginView
extension LoginViewController: LoginViewControllerDelegate {
    @objc
    func loginButtonHandler() {
        print("LoginViewController => loginButtonHandler() with values \(self.emailText!) and \(self.passwordText!)")
        UserDefaults.standard.setValue(true, forKey: "logged_in")
        SceneDelegate.shared.rootViewController.switchToMainScreen()
        guard let emailText = self.emailText, let passwordText = self.passwordText else {return}
        WebClient.shared.loginRequest(email: emailText, password: passwordText)
    }
    
    @objc
    func setEmailTextFromUITextField(sender: UITextField) {
        self.emailText = sender.text
    }
    
    @objc
    func setPasswordTextFromUITextField(sender: UITextField) {
        self.passwordText = sender.text
    }
}
