//
//  GameViewController.swift
//  1024
//
//  Created by Martin Kong on 1/8/19.
//  Copyright © 2019 Martin Kong. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, UIGestureRecognizerDelegate {
    var scene: GameScene!
    var game: Game!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = self.view as! SKView
        skView.isMultipleTouchEnabled = false
        scene = GameScene()
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        game = Game()
        game.start()
        scoreLabel.text = "\(game.score)"
        scene.updateGame(game: game)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        game.moveRight()
        scoreLabel.text = "\(game.score)"
        scene.updateGame(game: game)
        //print("right")
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        game.moveLeft()
        scoreLabel.text = "\(game.score)"
        scene.updateGame(game: game)
        //print("left")
    }
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        game.moveUp()
        scoreLabel.text = "\(game.score)"
        scene.updateGame(game: game)
        //print("up")
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        game.moveDown()
        scoreLabel.text = "\(game.score)"
        scene.updateGame(game: game)
        //print("down")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        game.restartGame()
        scoreLabel.text = "\(game.score)"
        scene.updateGame(game: game)
    }
}
