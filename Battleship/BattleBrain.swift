//
//  BattleBrain.swift
//  Battleship
//
//  Created by Marty Avedon on 9/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class MontyBrain {
    let numSquares: Int
    let ships: [Ship]
    
    init(numSquares:Int, ships:[Ship]) {
        self.numSquares = numSquares
        self.ships = ships
        var numSpots = 0
        for ship in ships {
            //setupSquares(numSpots: ship.numParts)
            numSpots += ship.numParts
        }
        setupSquares(numSpots: numSpots)
    }
    
    fileprivate enum State {
        case hit
        case miss
    }
    
    private  var squares = [State]()
    /*private*/ var checkerArr = [Int]()
    
    func generateSpot() -> Int {
        let coor: Int
        coor = Int(arc4random_uniform(UInt32(numSquares)))
        return coor
    }
    
    func setupSquares(numSpots: Int) /*-> [Int]*/ {
        squares = Array(repeating: .miss, count: numSquares)
        for _ in 1...numSpots {
            var newCoor = generateSpot()
            if checkerArr.contains(newCoor) && newCoor != 10 {
                newCoor += 1
            } else if checkerArr.contains(newCoor) && newCoor == 10 {
                newCoor -= 1
            } else {
                if checkerArr.count < numSpots {
                    checkerArr.append(newCoor)
                } else {
                    break
                }
            }
            squares[newCoor] = .hit
        }
        //i want this to loop thru the ships individually and hand off arrays containing their coors god damn it
        //return checkerArr
    }
    
    func checkSquare(_ cardIn: Int) -> Bool {
        assert(cardIn < squares.count)  //helps with debugging
        return squares[cardIn] == .hit
    }
}
