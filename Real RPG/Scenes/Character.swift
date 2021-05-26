//
//  PlayerCharacter.com.swift
//  Real RPG
//
//  Created by Bobby the Constructor on 29/4/21.
//

import Foundation
import SpriteKit

// requires more customization to include assets
// SKSpriteNode has visual representation and many children
class Character : SKSpriteNode {
    var level = 1
    var className = "default"
    var headGearName = "empty"
    var leftHandGearName = "empty"
    var rightHandGearName = "empty"
    var shoesName = "empty"
    var hairName = "empty"
    var bodyName = "empty"
    var bottomName = "empty"
    var beltName = "empty"
    var skinColor = UIColor.white
    
    func updateBodyGear(itemName:String){
        
    }
    
    func updateRightHandGear(gearName:String){
        let gearNode = SKSpriteNode()
        gearNode.texture = SKTexture(imageNamed: gearName)
        gearNode.size = CGSize(width: 30, height: 30)
        gearNode.zPosition = 120
        gearNode.physicsBody?.allowsRotation = true
        
        // get the position of the player's character
        let playerPosition = self.position
        gearNode.position = CGPoint(x: playerPosition.x-23, y: playerPosition.y)
        self.addChild(gearNode)
    }
}
