//
//  ViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-10.
//

import UIKit

class ViewController: UIViewController {

    var loginButton:UIButton?
    var emailTextField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton = UIButton()
        self.emailTextField = UITextField()
        
        guard let loginButton = self.loginButton else {print("\(String(describing: self)): loginButton was nil");return}
        guard let emailTextField = self.emailTextField else {print("\(String(describing: self)): emailTextField was nil");return}
        
        initLoginButton(button: loginButton)
        initEmailTextField(textField: emailTextField)
        setupConstraints(button: loginButton, textField: emailTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.purple
    }
    
    func initLoginButton(button: UIButton) {
        print("\(String(describing: self)): initializing login button")
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        button.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 0.75)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.view.addSubview(button)
    }
    
    func initEmailTextField(textField: UITextField) {
        print("\(String(describing: self)): initializing emailTextField")
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        textField.layer.backgroundColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.attributedPlaceholder = NSAttributedString(string: "E-mail Adress", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        self.view.addSubview(textField)
    }
    
    func setupConstraints(button: UIButton, textField: UITextField) {
        print("\(String(describing: self)): setting up login button constraints")
        button.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //Login button
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            button.heightAnchor.constraint(equalToConstant: 100.0),
            button.widthAnchor.constraint(equalToConstant: 200.0),
            //Email text field
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant: 40.0),
            textField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 25)
        ])
    }
    
    @objc
    func buttonAction() {
        print("clicked a button")
    }
    


}

