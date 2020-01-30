//
//  SnakeBodyPart.swift
//  Snake
//
//  Created by Evgeny Kolesnik on 29.01.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    
    let diametr = 10
    
    init(atPoint point:CGPoint) {
    super.init()
    
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: CGFloat(diametr), height: CGFloat(diametr))).cgPath
        fillColor = UIColor.green
        strokeColor = UIColor.green
        
        lineWidth = 5
        
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diametr-4), center: CGPoint(x: 5, y: 5))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = CollisionCategories.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple
    
}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    
}
