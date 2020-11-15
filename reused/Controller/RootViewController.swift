//
//  RootViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-13.
//
//
//  ViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-10.
//

import UIKit

class RootViewController: UIViewController {
    
    private var current: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded the RootViewController")
        self.addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }

    init() {
        self.current = LoadingViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showLoginScreen() {
        
        let lvc = LoginViewController()
        let navigationController = UINavigationController(rootViewController: lvc)
        self.addChild(navigationController)
        navigationController.view.frame = view.bounds
        view.addSubview(navigationController.view)
        navigationController.didMove(toParent: self)
        
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = navigationController
    }
    
    func switchToMainScreen() {
        let mvc = MainViewController()
        let navigationController = UINavigationController(rootViewController: mvc)
        //animateFadeTransition(to: navigationController)
        current.willMove(toParent: nil)
        self.addChild(navigationController)

        transition(from: current, to: navigationController, duration: 1.0, options: [.transitionFlipFromRight], animations: {}, completion: { completed in
            print("transition successful")
        })
        current.removeFromParent()
        current.didMove(toParent: self)
        current = navigationController
    }
    
//    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
//       current.willMove(toParent: nil)
//       addChild(new)
//
//       transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
//       }) { completed in
//            self.current.removeFromParent()
//            new.didMove(toParent: self)
//            self.current = new
//            completion?()
//       }
//    }
}
