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
    
    //We're kind of treating this like a UIViewController at first
    private var current: UINavigationController
    
    public var currentNavigationController : UINavigationController {
        get {return self.current}
        set {self.current = newValue}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded the RootViewController")
        self.addChild(currentNavigationController)
        currentNavigationController.view.frame = view.bounds
        view.addSubview(currentNavigationController.view)
        currentNavigationController.didMove(toParent: self)
    }

    init() {
        let nav = UINavigationController(rootViewController: LoadingViewController())
        self.current = nav
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //We don't want the user to be able to "go back", which would take them to the LoadingViewController
    //since, on app initialization the LoadingViewController is set as current (see init in this class)
    //and the LoadingViewController checks to see if the user is logged in or not.
    //If they are not, this function is called and we want RootViewController's "current" navigationController
    //to a new navigationController with a fresh stack, without the ability to navigate backwards. Similarly
    //with the switchToMainScreen function below.
    func switchToLoginScreen() {
        //Clear the viewcontroller stack if we log out
        self.currentNavigationController.viewControllers.removeAll()
        let lvc = LoginViewController()
        let navigationController = UINavigationController(rootViewController: lvc)
        
        
        //navigationController.view.frame = view.bounds
        //view.addSubview(navigationController.view)
        
        currentNavigationController.willMove(toParent: nil)
        self.addChild(navigationController)
        
        transition(from: currentNavigationController, to: navigationController, duration: 0.75, options: [.transitionFlipFromRight], animations: {}, completion: { completed in
            print("transition to LoginViewController successful")
        })
        
        currentNavigationController.view.removeFromSuperview()
        currentNavigationController.removeFromParent()
        currentNavigationController.didMove(toParent: self)
        currentNavigationController = navigationController
    }
    
    //The LoadingViewController will call this if the user is already logged in
    //or the LoginViewController will call this when authentication is complete.
    func switchToMainScreen() {
        self.currentNavigationController.viewControllers.removeAll()
        let mvc = MainViewController()
        let navigationController = UINavigationController(rootViewController: mvc)
        
        //animateFadeTransition(to: navigationController)
        currentNavigationController.willMove(toParent: nil)
        self.addChild(navigationController)

        transition(from: currentNavigationController, to: navigationController, duration: 0.75, options: [.transitionFlipFromRight], animations: {}, completion: { completed in
            print("transition MainViewController successful")
        })
        
        currentNavigationController.view.removeFromSuperview()
        currentNavigationController.removeFromParent()
        currentNavigationController.didMove(toParent: self)
        currentNavigationController = navigationController
    }
}
