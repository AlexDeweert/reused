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
    private var _currentNavController: UINavigationController
    
    public var currentNavController : UINavigationController {
        get {return self._currentNavController}
        set {self._currentNavController = newValue}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded the RootViewController")
        self.addChild(currentNavController)
        currentNavController.view.frame = view.bounds
        view.addSubview(currentNavController.view)
        currentNavController.didMove(toParent: self)
    }

    init() {
        let nav = UINavigationController(rootViewController: LoadingViewController())
        self._currentNavController = nav
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
        self.currentNavController.viewControllers.removeAll()
        let lvc = LoginViewController()
        let navigationController = UINavigationController(rootViewController: lvc)
        
        
        //navigationController.view.frame = view.bounds
        //view.addSubview(navigationController.view)
        
        currentNavController.willMove(toParent: nil)
        self.addChild(navigationController)
        
        transition(from: currentNavController, to: navigationController, duration: 0.75, options: [.transitionFlipFromRight], animations: {}, completion: { completed in
            print("transition to LoginViewController successful")
        })
        
        currentNavController.view.removeFromSuperview()
        currentNavController.removeFromParent()
        currentNavController.didMove(toParent: self)
        currentNavController = navigationController
    }
    
    //The LoadingViewController will call this if the user is already logged in
    //or the LoginViewController will call this when authentication is complete.
    func switchToMainScreen() {
        self.currentNavController.viewControllers.removeAll()
        let mvc = MainViewController()
        let navigationController = UINavigationController(rootViewController: mvc)
        
        //animateFadeTransition(to: navigationController)
        self.currentNavController.willMove(toParent: nil)
        self.addChild(navigationController)

        transition(from: currentNavController, to: navigationController, duration: 0.75, options: [.transitionFlipFromRight], animations: {}, completion: { completed in
            print("transition MainViewController successful")
        })
        
        currentNavController.view.removeFromSuperview()
        currentNavController.removeFromParent()
        currentNavController.didMove(toParent: self)
        currentNavController = navigationController
    }
}
