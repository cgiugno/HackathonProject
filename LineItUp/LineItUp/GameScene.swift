//
//  GameScene.swift
//  LineItUp
//
//  Created by Laurie Giugno on 11/11/20.
//  Copyright © 2020 kaak. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let circleNode = SKShapeNode(circleOfRadius: 350)
    
    var insideArrow = SKSpriteNode()
    var outsideArrow = SKSpriteNode()
    
    override func didMove(to view: SKView) {

        circleNode.fillColor = UIColor.red
        circleNode.glowWidth = 10
        self.addChild(circleNode)
        
    
        insideArrow = makeinsideArrow()
        outsideArrow = makeoutsideArrow()
        
        outsideArrow.physicsBody?.isDynamic = false // Move this back to makeoutsideArrow()
        insideArrow.run(SKAction.rotate(byAngle: 180.0, duration: 100), withKey: "rotateArrow")
    }
    
    func makeoutsideArrow() -> SKSpriteNode {
        let outsideArrowTexture = SKTexture(imageNamed: "clockPointer.png")
        let outsideArrow = SKSpriteNode(texture: outsideArrowTexture)
        
        
        outsideArrow.name = "outsideArrow"
        
        outsideArrow.anchorPoint = CGPoint(x: 0.5 , y: 0)
        outsideArrow.position = CGPoint(x: 0, y: (circleNode.frame.height - (circleNode.frame.height / 2)) - 200)
        outsideArrow.physicsBody = SKPhysicsBody(texture: outsideArrowTexture, size: outsideArrowTexture.size())
        
        addChild(outsideArrow)
        return outsideArrow
    }
    
    func makeinsideArrow() -> SKSpriteNode {
        let insideArrowTexture = SKTexture(imageNamed: "clockPointer.png")
        let insideArrow = SKSpriteNode(texture: insideArrowTexture)
        
        
        insideArrow.name = "insideArrow"
        
        insideArrow.anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        insideArrow.position = CGPoint(x: 0, y: 0)
       //insideArrow.physicsBody = SKPhysicsBody(texture: insideArrowTexture, size: insideArrowTexture.size())
        
        circleNode.addChild(insideArrow)
        return insideArrow
    }
    


    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
        
//        if let n = self.squareNode.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
        
        
    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
    // Needed -------
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        insideArrow.removeAction(forKey: "rotateArrow")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    // Needed ------
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

//extension GameScene: SKPhysicsContactDelegate {
//
//    func didBegin(_ contact: SKPhysicsContact) {
//        if contact.bodyA.node?.name == "coin" || contact.bodyB.node?.name == "coin" {
//            if contact.bodyA.node == outsideArrow {
//                contact.bodyB.node?.removeFromParent()
//            } else {
//                contact.bodyA.node?.removeFromParent()
//            }
//            run(sndCollect)
//            score += 1
//        } else if contact.bodyA.node?.name == "pillar" || contact.bodyB.node?.name == "pillar" {
//            stopGame()
//        }
//    }
//}
