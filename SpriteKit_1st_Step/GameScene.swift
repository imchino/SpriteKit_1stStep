//
//  GameScene.swift
//  SpriteKit_1st_Step
//
//  Created by 新井進鎬 on 2016/09/13.
//  Copyright © 2016年 chino. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    private var greetingLabel: SKLabelNode?
    private var spinnyNode: SKShapeNode?
    
    override func didMove(to view: SKView) {

        //ラベルの出現アニメーション
        self.greetingLabel = self.childNode(withName: "/greetingLabel") as? SKLabelNode
        if let label = greetingLabel {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 3.0))
        }
        
        // タッチで出現するノード
        let length = (self.size.width + self.size.height) * 0.05
        let rectangle = CGSize(width: length, height: length)
        self.spinnyNode = SKShapeNode(rectOf: rectangle, cornerRadius: length * 0.3)    // 角マル
        
        // ノードのアニメーション
        if let node = self.spinnyNode {
            node.lineWidth = 2.5
            node.run(SKAction.repeatForever(.rotate(byAngle: CGFloat(M_PI), duration: 1.0)))
            node.run(SKAction.sequence([.wait(forDuration: 0.5),
                                        .fadeOut(withDuration: 0.5),
                                        .removeFromParent()]))
        }
    }
    
    func drawSpinnyNode(atPoint pos: CGPoint, withColor color: SKColor) {
        if let node = self.spinnyNode?.copy() as? SKShapeNode {
            node.position = pos
            node.strokeColor = color
            self.addChild(node)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.greetingLabel {
            label.run(SKAction(named: "Pulse")!)    //"Pulse"はファイル名じゃなくて、アクション名
        }
        
        for touche in touches {
            drawSpinnyNode(atPoint: touche.location(in: self), withColor: .blue)
        }
     }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touche in touches {
            drawSpinnyNode(atPoint: touche.location(in: self), withColor: .green)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touche in touches {
            drawSpinnyNode(atPoint: touche.location(in: self), withColor: .red)
        }
    }
}
