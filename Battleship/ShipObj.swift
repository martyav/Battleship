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
    var parts: Int
    
    //if ship is hit, subtract 1 from parts
    
    func hit() -> Int {
        self.parts -= 1
        return self.parts
    }
    
    //write to label.text
    
    func msg() -> String {
        let victoryMsg = "You sank my \(name)!"
        let hitMsg = "You hit my \(name)!"
        if parts == 0 {
            return victoryMsg
        } else {
            return hitMsg
        }
    }
    
    // init
    
    init(name:String, parts:Int) {
        self.name = name
        self.parts = parts
    }
    
}

/// Our Ship subclasses ///

class Destroyer: Ship {
    init() {
        super.init(name: "Destroyer", parts: 2)
    }
}

class Submarine: Ship {
    init() {
        super.init(name: "Submarine", parts: 3)
    }
}

class Cruiser: Ship {
    init() {
        super.init(name: "Cruiser", parts: 3)
    }
}

class Battleship: Ship {
    init() {
        super.init(name: "Battleship", parts: 4)
    }
}

class Carrier: Ship {
    init() {
        super.init(name: "Carrier", parts: 5)
    }
}
