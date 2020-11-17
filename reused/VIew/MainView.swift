//
//  MainView.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-13.
//

import UIKit

class MainView : UIView {
    
    var logoutButton:UIButton?
    var chatButton:UIButton?
    var emailTextField:UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.logoutButton = UIButton()
        guard let logoutButton = self.logoutButton else {return}
        self.chatButton = UIButton()
        guard let chatButton = self.chatButton else {return}
        initLogoutButton(button: logoutButton)
        initChatButton(button: chatButton)
        setupConstraints(logoutButton: logoutButton, chatButton: chatButton)
        print("\(String(describing: self)) => init()")
    }
    
    //All subclasses of UIView must implement required init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("\(String(describing: self)) => required init(code: NSCoder)")
    }
    
    func initLogoutButton(button: UIButton) {
        print("\(String(describing: self)) => initLogoutButton(...)")
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonHandler), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        button.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 0, alpha: 0.85)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.addSubview(button)
    }
    
    func initChatButton(button: UIButton) {
        print("\(String(describing: self)) => initChatButton(...)")
        button.setTitle("Chat", for: .normal)
        button.addTarget(self, action: #selector(chatButtonHandler), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        button.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 0, alpha: 0.85)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.addSubview(button)
    }
    
    func setupConstraints(logoutButton: UIButton, chatButton: UIButton) {
        print("\(String(describing: self)) => setupConstraints(...)")
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //Logout button
            logoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            logoutButton.heightAnchor.constraint(equalToConstant: 100.0),
            logoutButton.widthAnchor.constraint(equalToConstant: 200.0),
            //Chat button
            chatButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            chatButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 20),
            chatButton.heightAnchor.constraint(equalToConstant: 100.0),
            chatButton.widthAnchor.constraint(equalToConstant: 200.0)
        ])
        
    }
}

extension MainView {
    @objc
    func logoutButtonHandler() {
        print("\(String(describing: self)) => logoutButtonHandler()")
        UserDefaults.standard.setValue(false, forKey: "logged_in")
        SceneDelegate.shared.rootViewController.switchToLoginScreen()
    }
    
    @objc
    func chatButtonHandler() {
        print("\(String(describing: self)) => chatButtonHandler()")
        let chatViewController = ChatViewController()
        let nav = SceneDelegate.shared.rootViewController.currentNavController
        nav.pushViewController(chatViewController, animated: true)
    }
}
