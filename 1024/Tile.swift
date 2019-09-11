//
//  Tile.swift
//  1024
//
//  Created by Martin Kong on 1/8/19.
//  Copyright © 2019 Martin Kong. All rights reserved.
//

import SpriteKit

class Tile {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    func double() {
        number = number * 2
    }
    
    func getNumber() -> Int {
        return number
    }
    
    func equals(tile: Tile) -> Bool {
        return self.number == tile.getNumber()
    }
}
