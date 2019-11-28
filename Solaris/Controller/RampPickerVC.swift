//
//  RampPickerVC.swift
//  Solaris
//
//  Created by Nazar Petruk on 27/11/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit
import SceneKit


class RampPickerVC: UIViewController {
    
    var sceneView: SCNView!
    var size: CGSize!
    
    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame = CGRect(origin: CGPoint.zero, size: size)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.insertSubview(sceneView, at: 0)
        
        let scene = SCNScene(named: "art.scnassets/PopOverScene.scn")!
        sceneView.scene = scene
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let obj = SCNScene(named: "art.scnassets/pipe.dae")
        let node = obj?.rootNode.childNode(withName: "pipe", recursively: true)!
        node?.scale = SCNVector3Make(0.0012, 0.0012, 0.0012)
        node?.position = SCNVector3Make(-0.95, 0.5, -1)
        scene.rootNode.addChildNode(node!)
        
        preferredContentSize = size
    }
}
