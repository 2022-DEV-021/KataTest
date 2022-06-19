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
    //    Players cannot play on a played position.
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
        self.addValueToBoard(sender: sender)
        
        // Check for Draw
        if(fullBoard()){
            print("Draw\(self.fullBoard())")
            self.alertForWinnerandReset(msg: "Match draw..!")
        }
        // Check for CROSS
        if checkForVictory(CROSS){
            print("Cross won the match")
            self.alertForWinnerandReset(msg: "Cross won the match")
        }
        // Check for DOT
        if checkForVictory(DOT){
            print("Dot won the match")
            self.alertForWinnerandReset(msg: "Dot won the match")
        }
    }
    
    //    what if X goes first. It should accept X as first move
    func addValueToBoard(sender: UIButton){
        //        for the first time boardValue will be empty
        if(self.boardValueas[sender.tag] == ""){
            if(currentTurn == Turn.Dot){
                self.boardValueas[sender.tag] = DOT
                sender.setTitle(DOT, for: .normal)
                currentTurn = Turn.Cross
                //      Always X goes first
            }else if(currentTurn == Turn.Cross){
                self.boardValueas[sender.tag] = CROSS
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Dot
            }
            //            Players cannot play on a played position.
            sender.isEnabled = false
        }
    }
    
    //    Check for all nine squares are filled or not
    func fullBoard() -> Bool{
        for value in self.boardValueas{
            if value == ""{
                return false
            }
        }
        return true
    }
    
    //   Check one player has three in a row, horizontally, vertically or diagonally and if not Draw
    func checkForVictory(_ str : String) -> Bool{
        
        //        str is either X or O though we need to check horizontal positions(location) and X or O
        if checkForXorO(0, str) && checkForXorO(1, str) && checkForXorO(2, str){
            return true
        }
        if checkForXorO(3, str) && checkForXorO(4, str) && checkForXorO(5, str){
            return true
        }
        if checkForXorO(6, str) && checkForXorO(7, str) && checkForXorO(8, str){
            return true
        }
        //      str is either X or O though we need to check vertical positions(location) and X or O
        if checkForXorO(0, str) && checkForXorO(3, str) && checkForXorO(6, str)
        {
            return true
        }
        if checkForXorO(1, str) && checkForXorO(4, str) && checkForXorO(7, str)
        {
            return true
        }
        if checkForXorO(2, str) && checkForXorO(5, str) && checkForXorO(8, str)
        {
            return true
        }
        
        //      str is either X or O though we need to check diagonal positions(location) and X or O
        if checkForXorO(0, str) && checkForXorO(4, str) && checkForXorO(8, str)
        {
            return true
        }
        if checkForXorO(2, str) && checkForXorO(4, str) && checkForXorO(6, str)
        {
            return true
        }
        //        Draw match
        return false
    }
    
    //    Check for X or O
    func checkForXorO(_ index: Int, _ xORo: String) -> Bool{
        return self.boardValueas[index] == xORo
    }
    
    
    //    Once player won the match or draw then, need to show alert message and reset the game to play again
    func alertForWinnerandReset(msg: String){
        let resetAlert = UIAlertController(title: "Play Again?", message: "\(msg)", preferredStyle: .alert)
        
        resetAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            //            Reset the board values
            self.resetBoardValues()
        }))
        resetAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        self.present(resetAlert, animated: true)
    }
    //    reset the board and board values though player can play again
    func resetBoardValues(){
        self.initBoardValues()
        self.resetBoard()
    }
    func resetBoard(){
        for btn in board{
            btn.setTitle(nil, for: .normal)
            //            Players cannot play on a played position. - enable button action
            btn.isEnabled = true
        }
        if secondTurn == Turn.Dot{
            secondTurn = Turn.Cross
        }
        else if secondTurn == Turn.Cross{
            secondTurn = Turn.Dot
        }
        //        X always goes first.
        currentTurn = Turn.Cross
    }
}
