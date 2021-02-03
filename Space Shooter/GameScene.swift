//
//  GameScene.swift
//  Space Shooter
//
//  Created by Anya Kapoor on 1/26/21.
//  Copyright © 2021 Anya Kapoor. All rights reserved.
//

import SpriteKit
import GameplayKit
enum CollisionType: UInt32 {
    case player = 1
    case playerWeapon = 2
    case enemy = 4
    case enemyWeapon = 8
}
class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "spaceship")
   
    override func didMove(to view: SKView) {
        if let particles = SKEmitterNode(fileNamed: "Stars"){
            particles.position = CGPoint(x: 1080, y: 0)
         //   particles.advanceSimulationTime(<#T##sec: TimeInterval##TimeInterval#>)
            addChild(particles)
        }
        player.name = "player"
        player.position.x = frame.minX + 75
        player.zPosition = 1
        addChild(player)
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        player.physicsBody?.collisionBitMask = CollisonType.enemy.rawValue |CollisonType.enemyWeapon.rawValue
        
        setupLabels()
    }
    func setupLabels(){
        let scoreTextLabel: SKLabelNode = SKLabelNode(text: "score")
        scoreTextLabel.position = CGPoint(x: 14.0, y: frame.size.height - 200.0)
        scoreTextLabel.horizontalAlignmentMode = .left
        scoreTextLabel.fontName = "Courier-Bold"
        scoreTextLabel.fontSize = 14.0
        scoreTextLabel.zPosition = 20
        addChild(scoreTextLabel)
    }
}
