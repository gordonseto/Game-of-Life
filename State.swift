//
//  State.swift
//  Game of Life
//
//  Created by Gordon Seto on 2016-07-25.
//  Copyright © 2016 gordonseto. All rights reserved.
//

import Foundation

enum State: Int {
    case Living = 0, PreBirth, Dead
    
    static func randomState() -> State {
        guard let state = State(rawValue: Int (arc4random_uniform(2))) else {
            return .PreBirth
        }
        
        return state
    }
}