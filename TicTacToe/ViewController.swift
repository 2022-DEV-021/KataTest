//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kishor Reddy on 15/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    //    Outlets goes here
    //    first-row
    @IBOutlet weak var rc11: UIButton!
    @IBOutlet weak var rc12: UIButton!
    @IBOutlet weak var rc13: UIButton!
    //    Second-row
    @IBOutlet weak var rc21: UIButton!
    @IBOutlet weak var rc22: UIButton!
    @IBOutlet weak var rc23: UIButton!
    //    Third-row
    @IBOutlet weak var rc31: UIButton!
    @IBOutlet weak var rc32: UIButton!
    @IBOutlet weak var rc33: UIButton!
    
    
    var board = [UIButton]()
    var boardValueas = [String]()
    var DOT = "O"
    var CROSS = "X"
    enum Turn{
        case Dot
        case Cross
    }
    var currentTurn = Turn.Cross
    var secondTurn = Turn.Dot
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initBoard()
        self.initBoardValues()
    }
    func initBoard(){
        self.board = [rc11, rc12, rc13,
                      rc21, rc22, rc23,
                      rc31, rc32, rc33]
    }
    func initBoardValues(){
        self.boardValueas = ["", "", "",
                             "", "", "",
                             "", "", ""]
    }
    
    @IBAction func gameActions(_ sender: UIButton) {
        //  TODO:  All Clickable actions here
    }
    
    //    what if X goes first. It should accept X as first move
    func addValueToBoard(sender: UIButton){
        if(self.boardValueas[sender.tag] == ""){
            if(currentTurn == Turn.Dot){
                self.boardValueas[sender.tag] = DOT
                sender.setTitle(DOT, for: .normal)
                currentTurn = Turn.Cross
            }else if(currentTurn == Turn.Cross){
                self.boardValueas[sender.tag] = CROSS
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Dot
            }
        }
    }
}

