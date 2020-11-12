//
//  AppState.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-12.
//

import Foundation
import ReSwift

struct AppState : StateType {
    
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState()
}

var store = Store<AppState>(reducer: appReducer, state: nil)
