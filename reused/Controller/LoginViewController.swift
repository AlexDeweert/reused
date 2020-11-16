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
        self.view.addSubview(self.loginView)
        self.view = self.loginView
        print("\(String(describing: self)) => viewDidLoad()")
    }
}
