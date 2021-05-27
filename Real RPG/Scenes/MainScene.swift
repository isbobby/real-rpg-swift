//
//  MainScene.swift
//  Real RPG
//
//  Created by Leipetus  Hood  on 26/5/21.
//


import SpriteKit
import GameplayKit
import CoreMotion
class MainScene: SKScene {
    
    var motionMananger: CMMotionManager?
    let gameLabel = SKLabelNode(fontNamed: "HelveticaNeue-Thin")
    let jumpButton = SKSpriteNode(imageNamed: "samplebutton")
    let leftButton = SKSpriteNode(imageNamed: "samplebutton")
    let rightButton = SKSpriteNode(imageNamed: "samplebutton")
    let entryButton = SKSpriteNode(imageNamed: "samplebutton")
    
    let nextSceneButton = SKSpriteNode(imageNamed: "samplebutton")
    let previousSceneButton = SKSpriteNode(imageNamed: "samplebutton")
    
    let playerMainCharacter = Character()
    
    override func didMove(to view: SKView) {
        initPlayerCharacter()
        updateCharacter()
        
        // define physics body
        physicsBody = SKPhysicsBody(edgeLoopFrom:  frame.inset(by: UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)))
        motionMananger = CMMotionManager()
        physicsWorld.gravity = CGVector(dx: 0, dy: -10)
        
        // define game label
        gameLabel.fontSize = 10
        gameLabel.position = CGPoint(x: 0, y :0)
        gameLabel.text = "The Game I always wanted to make"
        gameLabel.color = UIColor.black
        gameLabel.zPosition = 100
        gameLabel.horizontalAlignmentMode = .center
        // addChild(gameLabel)
        
        // define game pad and buttons
        jumpButton.size = CGSize(width: 50, height: 50)
        jumpButton.position = CGPoint(x: 0, y :-290)
        addChild(jumpButton)
        
        leftButton.size = CGSize(width: 50, height: 50)
        leftButton.position = CGPoint(x: -120, y :-290)
        addChild(leftButton)
        
        rightButton.size = CGSize(width: 50, height: 50)
        rightButton.position = CGPoint(x: 120, y :-290)
        addChild(rightButton)
        
//        entryButton.size = CGSize(width: 50, height: 50)
//        entryButton.position = CGPoint(x: 0, y :-210)
//        addChild(entryButton)
        
//        nextSceneButton.size = CGSize(width: 50, height: 70)
//        nextSceneButton.position = CGPoint(x: 120, y :50)
//        addChild(nextSceneButton)
        
//        previousSceneButton.size = CGSize(width: 50, height: 70)
//        previousSceneButton.position = CGPoint(x: -120, y :50)
//        addChild(previousSceneButton)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // update the position of the fucking banana
        return
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
        
        if (touchedNode == jumpButton) {
            characterJump()
        } else if (touchedNode == leftButton) {
            characterMoveLeft()
        } else if (touchedNode == rightButton) {
            characterMoveRight()
        } else if (touchedNode == entryButton) {
        } else if (touchedNode == previousSceneButton) {
            previousCharacter()
        } else if (touchedNode == nextSceneButton) {
            nextCharacter()
        }
    }
    
    func characterJump() {
        playerMainCharacter.physicsBody?.applyForce(CGVector(dx: 0, dy: 2500))
    }
    
    func characterMoveLeft() {
        playerMainCharacter.physicsBody?.applyForce(CGVector(dx: -500, dy: 0))
    }
    
    func characterMoveRight() {
        playerMainCharacter.physicsBody?.applyForce(CGVector(dx: 500, dy: 0))
    }
    
    func nextCharacter() {
    }
    
    func previousCharacter() {
    }
    
    func loadCharacter() {
    }
    
    // Player character class is defined in /CustomClasses/PlayerCharacter
    func initPlayerCharacter() {
        playerMainCharacter.texture = SKTexture(imageNamed: "devCharacter")
        playerMainCharacter.size = CGSize(width: 160, height: 260)
        playerMainCharacter.physicsBody = SKPhysicsBody(circleOfRadius: 80)
        playerMainCharacter.name = String("mainCharacter")
        playerMainCharacter.physicsBody?.allowsRotation = false
        playerMainCharacter.physicsBody?.friction = 0.1
        playerMainCharacter.physicsBody?.restitution = 0
        playerMainCharacter.physicsBody?.mass = 0.1
        addChild(playerMainCharacter)
    }
    
    // A test function to update Character
    func updateCharacter() {
        // create a sample banana item
//        playerMainCharacter.updateRightHandGear(gearName: "banana")
    }
}
