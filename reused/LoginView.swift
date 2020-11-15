//
//  LoginView.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import UIKit

//@objc
//protocol LoginDelegate {
//    @objc
//    func loginButtonAction(_ sender: LoginView)
//}

class LoginView : UIView {
    
    var loginButton:UIButton?
    var emailTextField:UITextField?
    //var loginDelegate:LoginDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
        print("this")
        createSubviews()
    }
    
    //All subclasses of UIView must implement required init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.purple
        print("that")
        createSubviews()
    }
    
    func createSubviews() {
        self.loginButton = UIButton()
        self.emailTextField = UITextField()
        guard let loginButton = self.loginButton else {print("\(String(describing: self)): loginButton was nil");return}
        guard let emailTextField = self.emailTextField else {print("\(String(describing: self)): emailTextField was nil");return}
        initLoginButton(button: loginButton)
        initEmailTextField(textField: emailTextField)
        setupConstraints(button: loginButton, textField: emailTextField)
    }
    
    func initLoginButton(button: UIButton) {
        print("\(String(describing: self)): initializing login button")
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonHandler), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        button.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 0.75)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.addSubview(button)
    }
    
    func initEmailTextField(textField: UITextField) {
        print("\(String(describing: self)): initializing emailTextField")
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        textField.layer.backgroundColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.attributedPlaceholder = NSAttributedString(string: "E-mail Adress", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        self.addSubview(textField)
    }
    
    func setupConstraints(button: UIButton, textField: UITextField) {
        print("\(String(describing: self)): setting up login button constraints")
        button.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //Login button
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            button.heightAnchor.constraint(equalToConstant: 100.0),
            button.widthAnchor.constraint(equalToConstant: 200.0),
            //Email text field
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant: 40.0),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 25)
        ])
        
    }
    
    @objc
    func loginButtonHandler() {
        print("LoginViewController => Clicked the loginButtonAction function")
        UserDefaults.standard.setValue(true, forKey: "logged_in")
        //Can't get this fucker to work
        //loginDelegate?.loginButtonAction(self)
    }
    
}
