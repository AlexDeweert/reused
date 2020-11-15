//
//  AppRouter.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import ReSwift

enum RoutingDestination: String {
    case chat = "ChatViewController"
    case login = "LoginViewController"
}

final class AppRouter {
    
//    let rootNavigationController: UINavigationController?
    
    init(window: UIWindow) {
//        navigationController = UINavigationController()
//        window.rootViewController = navigationController
        
//        self.rootNavigationController = UIApplication.shared.windows.first(where: {$0.isKeyWindow})?.rootViewController as? UINavigationController
//        guard let rootNavigationController = self.rootNavigationController else {return}
//        print("rootNavigationController 1 => \(String (describing: rootNavigationController))")
        
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
        
        print("AppRouter can seee static rootViewController => \(String (describing: SceneDelegate.shared.rootViewController))")
    }
    
    fileprivate func pushViewController(identifier: String, animated: Bool) {
        print("AppRouter => Trying to pushViewController with identifier \(identifier)")
    }
}

extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
//        let shouldAnimate = navigationController.topViewController != nil
//        pushViewController(identifier: state.navigationState.rawValue, animated: shouldAnimate)
        pushViewController(identifier: state.navigationState.rawValue, animated: false)
    }
}
