//
//  GameScene.swift
//  1024
//
//  Created by Martin Kong on 1/8/19.
//  Copyright © 2019 Martin Kong. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override init() {
        super.init()
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        
        addChild(background)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func updateGame(game: Game) {
        for row in 0...3 {
            for column in 0...3 {
                let tempRow = CGFloat(row)
                let tempColumn = CGFloat(column)
                let point = CGPoint(x: frame.size.width * ((1 + 2 * tempColumn)/8.0), y: frame.size.height * ((34 - 9 * tempRow)/64.0))
                
                if game.gameBoard.get(column: column, row: row) != nil {
                    let tile: Tile = game.gameBoard.get(column: column, row: row)!
                    let spriteName: String = String(tile.number)
                    let sprite = SKSpriteNode(imageNamed: spriteName)
                    sprite.position = point
                    
                    addChild(sprite)
                } else {
                    let blank = SKSpriteNode(imageNamed: "blank")
                    blank.position = point
                    
                    addChild(blank)
                }
            }
        }
    }
}
