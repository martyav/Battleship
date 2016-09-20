//
//  ShipObj.swift
//  Battleship
//
//  Created by Marty Avedon on 9/18/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Ship {
    
    var name: String
    var numParts: Int
    var partsSpots = [Int]()
    
    //if ship is hit, subtract 1 from numParts
    
    func hit() -> Int {
        self.numParts -= 1
        return self.numParts
    }
    
    //find part
    
    func findPart(part: Int) -> Bool {
        return self.partsSpots.contains(part)
    }
    
    //write to label.text
    
    func msg() -> String {
        let victoryMsg = "You sank my \(name)!"
        let hitMsg = "You hit my \(name)!"
        if numParts == 0 {
            return victoryMsg
        } else {
            return hitMsg
        }
    }
    
    // init
    
    init(name:String, numParts:Int) {
        self.name = name
        self.numParts = numParts
    }
    
}

/// Our Ship subclasses ///

class Destroyer: Ship {
    init() {
        super.init(name: "Destroyer", numParts: 2)
    }
}

class Submarine: Ship {
    init() {
        super.init(name: "Submarine", numParts: 3)
    }
}

class Cruiser: Ship {
    init() {
        super.init(name: "Cruiser", numParts: 3)
    }
}

class Battleship: Ship {
    init() {
        super.init(name: "Battleship", numParts: 4)
    }
}

class Carrier: Ship {
    init() {
        super.init(name: "Carrier", numParts: 5)
    }
}

 //Check for Ship
