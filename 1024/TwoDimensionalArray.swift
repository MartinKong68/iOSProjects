//
//  TwoDimensionalArray.swift
//  1024
//
//  Created by Martin Kong on 1/8/19.
//  Copyright © 2019 Martin Kong. All rights reserved.
//

class TwoDimensionalArray<T> {
    let columns: Int
    let rows: Int
    
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        array = Array<T?>(repeating: nil, count: columns * rows)
    }
    
    func get(column: Int, row: Int) -> T? {
        return array[(columns * row) + column]
    }
    
    func set(column: Int, row: Int, newValue: T?) {
        array[(columns * row) + column] = newValue
    }
}
