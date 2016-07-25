//
//  GameBoard.swift
//  Game of Life
//
//  Created by Gordon Seto on 2016-07-25.
//  Copyright © 2016 gordonseto. All rights reserved.
//

import UIKit

class GameBoard: UIView {

    let life: Life
    
    init(createLife: Life) {
        life = createLife
        super.init(frame: CGRectMake(0, 0, 0, 0))
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let currentContext = UIGraphicsGetCurrentContext()
        
        for cell in life.cells {
            CGContextSetFillColorWithColor(currentContext, colorForCell(cell.state).CGColor)
            CGContextAddRect(currentContext, frameForCell(cell))
            CGContextFillPath(currentContext)
        }
    }
    
    func colorForCell(state: State) -> UIColor {
        switch state {
        case .Living:
            return UIColor(red: 54/255, green: 127/255, blue: 255/255, alpha: 1.0)
        case .Dead:
            return UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
        case .PreBirth:
            return UIColor(red: 0/255, green: 56/255, blue: 153/255, alpha: 1.0)
        }
    }
    
    func frameForCell(cell: Cell) -> CGRect {
        let dimensions = CGFloat(self.life.gridSize)
        let cellSize = CGSizeMake(self.bounds.width / dimensions, self.bounds.height / dimensions)
        return CGRectMake(CGFloat(cell.xCoord) * cellSize.width, CGFloat(cell.yCoord) * cellSize.height, cellSize.width, cellSize.height)
    }
}
