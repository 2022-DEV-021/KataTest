//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Kishor Reddy on 15/06/22.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    
    
    //
    var sut: ViewController!
    
    //    First rule X always goes first
    //    what if X goes first. It should accept X as first move
    func testPlayerWithX(){
        //        As per my understand, we need to follow GIVEN,WHEN,THEN,AND steps
        self.sut = ViewController()
        //WHEN
        let currentValue = self.sut.CROSS
        let expectedValue = "X"
        
        XCTAssertEqual(currentValue, expectedValue)
    }
    //  what if O goes first. It should not accept O as first move
    func testPlayerWithO(){
        self.sut = ViewController()
        //WHEN
        let currentValue = self.sut.CROSS
        let expectedValue = "O"
        
        XCTAssertNotEqual(currentValue, expectedValue)
    }
    
//  If all nine squares are filled and neither player has three in a row, the game is a draw.
    func testIsGameDraw(){
        self.sut = ViewController()
        self.sut.boardValueas = ["X", "X", "O",
                                 "O", "X", "X",
                                 "X", "O", "O"]
        XCTAssertFalse(self.sut.checkForVictory("X") && self.sut.checkForVictory("O"))
    }
//  Able to draw three X’s or O's in a row, that player wins
    
    // test for cross horizontal Victory
    func testCrossHorizontalVictory(){
        self.sut = ViewController()
        self.sut.boardValueas = ["X", "X", "X",
                                 "X", "O", "O",
                                 "O", "X", "O"]
        XCTAssert(self.sut.checkForVictory("X"))
    }
    // test for dot horizontal Victory
    func testDotHorizontalVictory(){
        self.sut = ViewController()
        self.sut.boardValueas = ["X", "O", "X",
                                 "O", "O", "O",
                                 "O", "X", "X"]
        XCTAssert(self.sut.checkForVictory("O"))
    }
    
    // test for cross Vertical Victory
    func testCrossVerticalVictory(){
        self.sut = ViewController()
        self.sut.boardValueas = ["X", "O", "X",
                                 "X", "O", "O",
                                 "X", "X", "O"]
        XCTAssert(self.sut.checkForVictory("X"))
    }
    // test for dot Vertical Victory
    func testDotVerticalVictory(){
        self.sut = ViewController()
        self.sut.boardValueas = ["X", "O", "X",
                                 "O", "O", "X",
                                 "X", "O", "O"]
        XCTAssert(self.sut.checkForVictory("O"))
    }
    // test for cross diagonal Victory
    func testCrossDiagonalVictory(){
        self.sut = ViewController()
        self.sut.boardValueas = ["X", "O", "X",
                                 "O", "X", "O",
                                 "X", "X", "O"]
        XCTAssert(self.sut.checkForVictory("X"))
    }
    // test for dot diagonal Victory
    func testDotDiagonalVictory(){
        self.sut = ViewController()
        self.sut.boardValueas = ["O", "X", "X",
                                 "O", "O", "X",
                                 "X", "O", "O"]
        XCTAssert(self.sut.checkForVictory("O"))
    }
}
