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
        fatalError("required init? not implemented in MainViewController")
    }

    init() {
        self.mainView = MainView()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.mainView
        print("MainViewController loaded")
    }
    
    
}

