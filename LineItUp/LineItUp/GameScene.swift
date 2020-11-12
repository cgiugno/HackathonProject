//
//  GameScene.swift
//  LineItUp
//
//  Created by Laurie Giugno on 11/11/20.
//  Copyright © 2020 kaak. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var circleNode = SKShapeNode(circleOfRadius: 350)
    
    var insideArrow = SKSpriteNode()
    var outsideArrow = SKSpriteNode()
    var rotate = SKAction()
    var inContact = false
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        circleNode.fillColor = UIColor.red
        circleNode.glowWidth = 10
        self.addChild(circleNode)
        
        
        insideArrow = makeinsideArrow()
        outsideArrow = makeoutsideArrow()
        
        outsideArrow.physicsBody?.isDynamic = false // Move this back to makeoutsideArrow()
        insideArrow.physicsBody?.isDynamic = false
        
        addChild(outsideArrow)
        circleNode.addChild(insideArrow)
        
    }
    
    func makeoutsideArrow() -> SKSpriteNode {
        let outsideArrowTexture = SKTexture(imageNamed: "clockPointer.png")
        outsideArrow = SKSpriteNode(texture: outsideArrowTexture)


        outsideArrow.name = "outsideArrow"

        outsideArrow.anchorPoint = CGPoint(x: 0.5 , y: 0)
        outsideArrow.position = CGPoint(x: 0, y: (circleNode.frame.height - (circleNode.frame.height / 2)) - 200)
        outsideArrow.physicsBody = SKPhysicsBody(texture: outsideArrowTexture, size: outsideArrowTexture.size())
        outsideArrow.physicsBody?.contactTestBitMask = outsideArrow.physicsBody!.collisionBitMask
        outsideArrow.physicsBody?.isDynamic = false
        outsideArrow.physicsBody?.allowsRotation = false
        outsideArrow.physicsBody?.affectedByGravity = false
        outsideArrow.zPosition = 1
        outsideArrow.physicsBody?.restitution = 0.75
        //addChild(outsideArrow)
        return outsideArrow
    }
    
    
    func makeinsideArrow() -> SKSpriteNode {
        let insideArrowTexture = SKTexture(imageNamed: "clockPointer.png")
        insideArrow = SKSpriteNode(texture: insideArrowTexture)
        
        
        insideArrow.name = "insideArrow"
        
        insideArrow.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        insideArrow.position = CGPoint(x: 0, y: 0)
        insideArrow.physicsBody = SKPhysicsBody(texture: insideArrowTexture, size: insideArrowTexture.size())
        insideArrow.physicsBody?.contactTestBitMask = insideArrow.physicsBody!.collisionBitMask
        insideArrow.physicsBody?.isDynamic = false
        insideArrow.physicsBody?.allowsRotation = true
        insideArrow.physicsBody?.affectedByGravity = false
        
        insideArrow.zPosition = 1
        rotate = SKAction.rotate(toAngle: 90.0, duration: 100)
        let forever = SKAction.repeatForever(rotate)
        insideArrow.run(forever)
        //circleNode.addChild(insideArrow)
        //addChild(insideArrow)
        return insideArrow
    }

    // Needed -------
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        insideArrow.removeAllActions()
        if insideArrow.intersects(outsideArrow) {
            print("LEVEL PASSED")
        } else {
            print("---------- GAME OVER --------------")
            
        }
    }
    

    // Needed ------
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        print("----------------- TOUCH ENDED --------------")
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
      
//        print("Inside arrow = ", insideArrow.zRotation)
//        print("Outside arrow = ", outsideArrow.zRotation)
        
    }
    
    func collisionBetween(outsideArrow: SKNode, object: SKNode) {
        if object.name == "outsideArrow" {
            print("DONEEEEEEEEE OUTSIDE ARROW");
        } else if object.name == "insideArrow" {
            print("DONEEEEEEEEEE INSIDE ARROW")
        }
    }
    
//    func didBegin(_ contact: SKPhysicsContact) {
//        if contact.bodyA.node?.name == "insideArrow" || contact.bodyA.node?.name == "outsideArrow" {
//            //print("------------   TOUCHED -----------")
//            collisionBetween(outsideArrow: contact.bodyA.node!, object: contact.bodyB.node!)
//        } else {
//            print("NO CONTACTT")
//        }
//
//    }
    
    
    
}

//extension GameScene: SKPhysicsContactDelegate {
//
//    func didBegin(_ contact: SKPhysicsContact) {
//        print("------------   TOUCHED -----------")
//    }
//}
