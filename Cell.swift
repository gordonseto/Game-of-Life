//
//  Cell.swift
//  Game of Life
//
//  Created by Gordon Seto on 2016-07-25.
//  Copyright © 2016 gordonseto. All rights reserved.
//

import Foundation

class Cell {
    let xCoord: Int
    let yCoord: Int
    var state: State
    
    init(x: Int, y: Int) {
        self.xCoord = x
        self.yCoord = y
        self.state = State.randomState()
    }
}