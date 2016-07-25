//
//  Life.swift
//  Game of Life
//
//  Created by Gordon Seto on 2016-07-25.
//  Copyright © 2016 gordonseto. All rights reserved.
//

import Foundation

class Life {
    var cells: [Cell]
    let grid = (0...20)
    
    init() {
        cells = [Cell]()
        cells = assignCellsToGrid()
    }
    
    lazy var assignCellsToGrid: () -> [Cell] = {
        [weak self] in
        
        return (0...20).flatMap { x in
            (0...20).map { Cell(x: x, y: $0) }
        }
        
        /*
        for xLoc in 0..<self!.gridSize {
            for yLoc in 0..<self!.gridSize {
                cells.append(Cell(x: xLoc, y: yLoc))
            }
        }*/
        
    }
    
    func evolve() {
        
        let liveCells = cells.filter {$0.state == .Living}
        let deadCells = cells.filter {$0.state != .Living}
        
        //rules 1, 2, 3
        let dyingCells = liveCells.filter { !( 2...3 ~= livingNeighbors($0))}
        
        //rule 4
        let newLife = deadCells.filter { livingNeighbors($0) == 3}
        
        newLife.forEach({$0.state = .Living})
        deadCells.forEach({$0.state = .Dead})
        
    }
    
    func cellNeighbors(cell: Cell) -> [Cell] {
        return self.cells.customFilter {
            self.cellsAreNeighbors(cell, sideB: $0)
        }
    }
    
    func cellsAreNeighbors(sideA: Cell, sideB: Cell) -> Bool {
        let a = abs(sideA.xCoord - sideB.xCoord)
        let b = abs(sideA.yCoord - sideB.yCoord)
        
        var check = false
        /*
         switch(a, b) {
         case (1, 1), (1, 0), (0, 1):
         check = true
         default:
         check = false
         }
         */
        
        if case (0...1, 0...1) = (a,b) where !(a == 0 && b == 0) {
            return true
        } else {
            return false
        }
        
    }
    
    func livingNeighbors(cell: Cell) -> Int {
        return cellNeighbors(cell).filter { $0.state == .Living }.count
    }
    
    
}