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
    //    Players cannot play on a played position.
    func testPlayedPosition(){
        
    }
}
