//
//  MainViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-13.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView: MainView
    
    required init?(coder: NSCoder) {
        self.mainView = MainView()
        super.init(nibName: nil, bundle: nil)
        print("\(String(describing: self)) => required init?(...)")
        fatalError("required init? not implemented in MainViewController")
    }

    init() {
        self.mainView = MainView()
        super.init(nibName: nil, bundle: nil)
        print("\(String(describing: self)) => init()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.mainView
        print("\(String(describing: self)) => viewDidLoad()")
    }
    
    
}

