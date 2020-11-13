//
//  RoutingState.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import ReSwift

struct RoutingState: StateType {
    var navigationState: RoutingDestination
  
    //The default route is the login page
    init(navigationState: RoutingDestination = .login) {
        self.navigationState = navigationState
    }
}
