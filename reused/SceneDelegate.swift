//
//  SceneDelegate.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?
    
    // MARK: TODO (Or not)
    // Depending on whether or not the app already contains an authenticated user, we might need
    // to set the rootViewController here to either "LoginViewController" or "MainViewController"
    // assuming that the app goes from [splash -> auth] or [splash -> main] or [main -> auth]
    // static let rootNavigationController: UINavigationController = UINavigationController(rootViewController: LoginViewController())

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // MARK: Application Entry Point
        // We can push a view controller this way if we delete the Main.Storyboard.
        
        // Following this guide:
        // https://www.zerotoappstore.com/how-to-start-an-ios-app-without-storyboards.html#for-xcode-11-and-up
        
        guard let windowScene = scene as? UIWindowScene else {return}
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        //window?.rootViewController = SceneDelegate.rootNavigationController
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        
        
        guard let window = window as UIWindow? else {return}
        appRouter = AppRouter(window: window)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

// This allows static reference to the SceneDelegate and it's rootViewController
// called like: let rvc = SceneDelegate.shared.rootViewController
extension SceneDelegate {
    static var shared: SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        let delegate = scene?.delegate as! SceneDelegate
        return delegate
    }
    
    var rootViewController: RootViewController {
        return window?.rootViewController as! RootViewController
    }
}
