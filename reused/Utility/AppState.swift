//
//  AppState.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import Foundation
import ReSwift

//Helpful ReSwift state tutorial
//https://www.raywenderlich.com/516-reswift-tutorial-memory-game-app

//RoutingState is a sub-state of AppState
struct AppState : StateType {
    let routingState: RoutingState
    
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(routingState: routingReducer(action: action, state: state?.routingState))
}

var store = Store<AppState>(reducer: appReducer, state: nil)
