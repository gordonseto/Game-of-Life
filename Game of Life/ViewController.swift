//
//  ViewController.swift
//  Game of Life
//
//  Created by Gordon Seto on 2016-07-25.
//  Copyright © 2016 gordonseto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boardView: UIView!
    var life = Life()
    let gameBoard : GameBoard
    var timer: NSTimer!
    
    required init?(coder aDecoder: NSCoder) {
        gameBoard = GameBoard(createLife: life)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameBoard.frame = boardView.frame
        gameBoard.center = CGPointMake(gameBoard.frame.size.width / 2, gameBoard.frame.size.height / 2)
        boardView.addSubview(gameBoard)
        
        let tap = UITapGestureRecognizer(target:  self, action: "startTimer:")
        boardView.addGestureRecognizer(tap)
    }
    
    func startTimer(recognizer: UIGestureRecognizer) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "moment", userInfo: nil, repeats: true)
    }

    func initializeGame() {
        life.cells.forEach { $0.state = State.randomState() }
    }

    @IBAction func handleResetButtonTapped(sender: AnyObject) {
        timer.invalidate()
        initializeGame()
        gameBoard.setNeedsDisplay()
    }
    
    func moment() {
        life.evolve()
        gameBoard.setNeedsDisplay()
    }

}

