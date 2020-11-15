//
//  ViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-10.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView
    
    required init?(coder: NSCoder) {
        print("2")
        fatalError("required init? not implemented in LoginViewController")
    }

    init() {
        print("3")
        self.loginView = LoginView()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.loginView)
        self.view = self.loginView
        print("LoginViewController loaded")
    }
}

//Can't get this to fucking work for some reason
//extension LoginViewController : LoginDelegate {
//
//}
