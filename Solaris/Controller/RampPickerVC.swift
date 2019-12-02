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
    
    weak var rampPlacerVC : RampPlacerVC!
    
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
        
        preferredContentSize = size
        let scene = SCNScene(named: "art.scnassets/PopOverScene.scn")!
        sceneView.scene = scene
        view.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.layer.borderWidth = 3.0
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
        
        
        
        let sun = Ramp.getSun()
        Ramp.rotationAction(node: sun)
        scene.rootNode.addChildNode(sun)
        
        let mercury = Ramp.getMercury()
        Ramp.rotationAction(node: mercury)
        scene.rootNode.addChildNode(mercury)
        
        let venus = Ramp.getVenus()
        Ramp.rotationAction(node: venus)
        scene.rootNode.addChildNode(venus)
        
        let earth = Ramp.getEarth()
        Ramp.rotationAction(node: earth)
        scene.rootNode.addChildNode(earth)
        
        let mars = Ramp.getMars()
        Ramp.rotationAction(node: mars)
        scene.rootNode.addChildNode(mars)
    }
    
    @objc func handleTap (_ gestureRecognizer : UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        
        if hitResults.count > 0 {
            let node = hitResults[0].node
            rampPlacerVC.onRampSelected(node.name!)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}
