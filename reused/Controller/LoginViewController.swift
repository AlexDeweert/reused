//
//  ViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-10.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
//    required init?(coder: NSCoder) {
//        print("2")
//        fatalError("required init? not implemented in LoginViewController")
//    }
//
//    required init(viewModel:LoginView) {
//        print("3")
//        super.init(nibName: nil, bundle: nil)
//        self.view = viewModel
//    }
//
//    convenience init() {
//        self.init()
//        fatalError("convenience init not implemented in LoginViewController")
//    }
    
    var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = loginView
    }
    
}
