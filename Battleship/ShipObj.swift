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
    
    func msg() -> String {
        let victoryMsg = "You sank my \(name)!"
        return victoryMsg
    }
    
    init(name:String, parts:Int) {
        self.name = name
        self.parts = parts
    }
    
}

/// Our Ship subclasses ///

class Destroyer: Ship {
    override init(name: String, parts: Int) {
        super.init(name: "Destroyer", parts: 2)
    }
}

class Submarine: Ship {
    override init(name: String, parts: Int) {
        super.init(name: "Submarine", parts: 3)
    }
}

class Cruiser: Ship {
    override init(name: String, parts: Int) {
        super.init(name: "Cruiser", parts: 3)
    }
}

class Battleship: Ship {
    override init(name: String, parts: Int) {
        super.init(name: "Battleship", parts: 4)
    }
}

class Carrier: Ship {
    override init(name: String, parts: Int) {
        super.init(name: "Carrier", parts: 5)
    }
}
