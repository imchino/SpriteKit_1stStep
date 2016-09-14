//
//  ViewController.swift
//  SpriteKit_1st_Step
//
//  Created by 新井進鎬 on 2016/09/13.
//  Copyright © 2016年 chino. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let skView = self.view as? SKView else { return }
        guard let gameScene = SKScene(fileNamed: "GameScene") else { return }

        gameScene.scaleMode = .aspectFill
        skView.presentScene(gameScene)
        
        skView.showsFPS = true
        skView.showsDrawCount = true
        skView.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return .allButUpsideDown
        default:
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

