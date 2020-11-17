//
//  LoginView.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import UIKit

@objc
protocol LoginViewControllerDelegate {
    func loginButtonHandler()
    func setEmailTextFromUITextField(sender: UITextField)
    func setPasswordTextFromUITextField(sender: UITextField)
}

class LoginView : UIView {
    
    var loginButton:UIButton?
    var emailTextField:UITextField?
    var passwordTextField:UITextField?
    var delegate: LoginViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
        createSubviews()
    }
    
    //All subclasses of UIView must implement required init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.purple
        createSubviews()
    }
    
    func createSubviews() {
        self.loginButton = UIButton()
        self.emailTextField = UITextField()
        self.passwordTextField = UITextField()
        guard let loginButton = self.loginButton else {print("\(String(describing: self)): loginButton was nil");return}
        guard let emailTextField = self.emailTextField else {print("\(String(describing: self)): emailTextField was nil");return}
        guard let passwordTextField = self.passwordTextField else {print("\(String(describing: self)): passwordTextField was nil");return}
        initLoginButton(button: loginButton)
        initEmailTextField(textField: emailTextField)
        initPasswordTextField(textField: passwordTextField)
        setupConstraints(button: loginButton, emailTextField: emailTextField, passwordTextField: passwordTextField)
    }
    
    func initLoginButton(button: UIButton) {
        print("\(String(describing: self)) => initLoginButton(...)")
        button.setTitle("Login", for: .normal)
        button.addTarget(delegate, action: #selector(delegate?.loginButtonHandler), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        button.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 0.75)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.addSubview(button)
    }
    
    func initEmailTextField(textField: UITextField) {
        print("\(String(describing: self)) => initEmailTextField(...)")
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        textField.layer.backgroundColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        
        textField.spellCheckingType = .no
//        textField.attributedPlaceholder = NSAttributedString(string: "E-mail Adress", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.textColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
//        textField.addTarget(delegate, action: #selector(delegate?.setEmailTextFromUITextField(sender:)), for: .editingChanged)
        self.addSubview(textField)
    }
    
    func initPasswordTextField(textField: UITextField) {
        print("\(String(describing: self)) => initPasswordTextField(...)")
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        textField.layer.backgroundColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.textColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.isSecureTextEntry = true
//        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
//        textField.addTarget(delegate, action: #selector(delegate?.setPasswordTextFromUITextField(sender:)), for: .editingChanged)
        self.addSubview(textField)
    }
    
    func setupConstraints(button: UIButton, emailTextField: UITextField, passwordTextField: UITextField) {
        print("\(String(describing: self)) => setupConstraints(...)")
        button.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //Login button
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200),
            button.heightAnchor.constraint(equalToConstant: 100.0),
            button.widthAnchor.constraint(equalToConstant: 200.0),
            //Email text field
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40.0),
            emailTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 25),
            //Password text field
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40.0),
            passwordTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 25)
        ])
        
    }
}
