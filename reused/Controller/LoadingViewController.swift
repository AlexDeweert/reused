//
//  LoadingViewController.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-13.
//

import UIKit

//This could be the same background color as the LaunchScreen.storyboard
class LoadingViewController : UIViewController {
    
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemPurple
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        initialServiceCalls()
    }
    
    private func initialServiceCalls() {
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3), execute: {
            self.activityIndicator.stopAnimating()
            
            if UserDefaults.standard.bool(forKey: "logged_in") {
                print("LoadingViewController => User logged in, will nav to main screen")
                SceneDelegate.shared.rootViewController.switchToMainScreen()
                //nav to main screen
            }
            else {
                print("LoadingViewController => User NOT logged in, will nav to login screen")
                //nav to login screen
                SceneDelegate.shared.rootViewController.switchToLoginScreen()
            }
        })
    }
    
}
