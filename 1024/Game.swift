//
//  Game.swift
//  1024
//
//  Created by Martin Kong on 1/8/19.
//  Copyright © 2019 Martin Kong. All rights reserved.
//

class Game {
    var gameBoard: TwoDimensionalArray<Tile>
    var score: Int
    
    init() {
        gameBoard = TwoDimensionalArray<Tile>(columns: 4, rows: 4)
        score = 0
    }
    
    func addRandomTile() {
        var randomColumn = Int.random(in: 0 ... 3)
        var randomRow = Int.random(in: 0 ... 3)
        
        while gameBoard.get(column: randomColumn, row: randomRow) != nil {
            randomColumn = Int.random(in: 0 ... 3)
            randomRow = Int.random(in: 0 ... 3)
        }
        
        let newTile = Tile(number: 1)
        gameBoard.set(column: randomColumn, row: randomRow, newValue: newTile)
        //print("random added")
    }
    
    func moveRight() {
        var moved: Bool = false
        
        for row in 0...3 {
            for column in (0...2).reversed() {
                if gameBoard.get(column: column, row: row) == nil {
                    continue
                }
                
                var temp = column + 1
                while temp < 4 {
                    if gameBoard.get(column: temp, row: row) == nil {
                        gameBoard.set(column: temp, row: row,
                            newValue: gameBoard.get(column: temp - 1, row: row)!)
                        gameBoard.set(column: temp - 1, row: row, newValue: nil)
                        moved = true
                    } else {
                        if gameBoard.get(column: temp, row: row)!.equals(tile:
                            gameBoard.get(column: temp - 1, row: row)!) {
                            gameBoard.get(column: temp, row: row)!.double()
                            gameBoard.set(column: temp - 1, row: row, newValue: nil)
                            
                            score = score + gameBoard.get(column: temp, row: row)!.getNumber()
                            moved = true
                        }
                        
                        break
                    }
                    
                    temp = temp + 1
                }
            }
        }
        
        if moved == true {
            addRandomTile()
        }
    }
    
    func moveLeft() {
        var moved: Bool = false
        
        for row in 0...3 {
            for column in 1...3 {
                if gameBoard.get(column: column, row: row) == nil {
                    continue
                }
                
                var temp = column - 1
                while temp > -1 {
                    if gameBoard.get(column: temp, row: row) == nil {
                        gameBoard.set(column: temp, row: row,
                                      newValue: gameBoard.get(column: temp + 1, row: row)!)
                        gameBoard.set(column: temp + 1, row: row, newValue: nil)
                        moved = true
                    } else {
                        if gameBoard.get(column: temp, row: row)!.equals(tile:
                            gameBoard.get(column: temp + 1, row: row)!) {
                            gameBoard.get(column: temp, row: row)!.double()
                            gameBoard.set(column: temp + 1, row: row, newValue: nil)
                            
                            score = score + gameBoard.get(column: temp, row: row)!.getNumber()
                            moved = true
                        }
                        
                        break
                    }
                    
                    temp = temp - 1
                }
            }
        }
        
        if moved == true {
            addRandomTile()
        }
    }
    
    func moveUp() {
        var moved: Bool = false
        
        for column in 0...3 {
            for row in 1...3 {
                if gameBoard.get(column: column, row: row) == nil {
                    continue
                }
                
                var temp = row - 1
                while temp > -1 {
                    if gameBoard.get(column: column, row: temp) == nil {
                        gameBoard.set(column: column, row: temp,
                                      newValue: gameBoard.get(column: column, row: temp + 1)!)
                        gameBoard.set(column: column, row: temp + 1, newValue: nil)
                        moved = true
                    } else {
                        if gameBoard.get(column: column, row: temp)!.equals(tile:
                            gameBoard.get(column: column, row: temp + 1)!) {
                            gameBoard.get(column: column, row: temp)!.double()
                            gameBoard.set(column: column, row: temp + 1, newValue: nil)
                            
                            score = score + gameBoard.get(column: column, row: temp)!.getNumber()
                            moved = true
                        }
                        
                        break
                    }
                    
                    temp = temp - 1
                }
            }
        }
        
        if moved == true {
            addRandomTile()
        }
    }
    
    func moveDown() {
        var moved: Bool = false
        
        for column in 0...3 {
            for row in (0...2).reversed() {
                if gameBoard.get(column: column, row: row) == nil {
                    continue
                }
                
                var temp = row + 1
                while temp < 4 {
                    if gameBoard.get(column: column, row: temp) == nil {
                        gameBoard.set(column: column, row: temp,
                                      newValue: gameBoard.get(column: column, row: temp - 1)!)
                        gameBoard.set(column: column, row: temp - 1, newValue: nil)
                        moved = true
                    } else {
                        if gameBoard.get(column: column, row: temp)!.equals(tile:
                            gameBoard.get(column: column, row: temp - 1)!) {
                            gameBoard.get(column: column, row: temp)!.double()
                            gameBoard.set(column: column, row: temp - 1, newValue: nil)
                            
                            score = score + gameBoard.get(column: column, row: temp)!.getNumber()
                            moved = true
                        }
                        
                        break
                    }
                    
                    temp = temp + 1
                }
            }
        }
        
        if moved == true {
            addRandomTile()
        }
    }
    
    func start() {
        addRandomTile()
    }
    
    func restartGame() {
        score = 0
        for row in 0...3 {
            for column in 0...3 {
                gameBoard.set(column: column, row: row, newValue: nil)
            }
        }
        addRandomTile()
    }
}
