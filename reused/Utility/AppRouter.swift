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
    
//    let navigationController: UINavigationController
    
    init(window: UIWindow) {
//        navigationController = UINavigationController()
//        window.rootViewController = navigationController
        
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
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
