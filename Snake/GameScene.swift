//
//  GameScene.swift
//  Snake
//
//  Created by Evgeny Kolesnik on 29.01.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import SpriteKit
import GameplayKit

struct CollisionCategories {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        createApple()
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
        
        backgroundColor = SKColor.black
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = true
        
        view.showsPhysics = true
        
        let counterClockwiseButton = SKShapeNode()
        
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)
        counterClockwiseButton.fillColor = UIColor.gray
        counterClockwiseButton.strokeColor = UIColor.gray
        counterClockwiseButton.lineWidth = 10
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)
        
        let clockWiseButton = SKShapeNode()
        clockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockWiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minX + 30)
        clockWiseButton.fillColor = UIColor.gray
        clockWiseButton.strokeColor = UIColor.gray
        clockWiseButton.lineWidth = 10
        clockWiseButton.name = "clockWiseButton"
        self.addChild(clockWiseButton)
        
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockwiseButton" || touchesNode.name == "clockWiseButton" else {
                return
            }
            touchesNode.fillColor = .green
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockwiseButton" || touchesNode.name == "clockWiseButton" else {
                return
            }
            touchesNode.fillColor = .gray
            
            if touchesNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockWise()
            } else if touchesNode.name == "clockWiseButton" {
                snake!.moveClockWise()
            }
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        snake!.move()
    }
    
    func createApple() {
        
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX-5)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY-5)))
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact){
        
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionBodyes = bodyes - CollisionCategories.SnakeHead
        
        switch collisionBodyes {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
            
        case CollisionCategories.EdgeBody:
            
            self.removeAllChildren()
            didMove(to: view!)
            
            break
            
        default:
            break
        }
        
    }
    
}
