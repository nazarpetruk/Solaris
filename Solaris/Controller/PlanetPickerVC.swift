//
//  RampPickerVC.swift
//  Solaris
//
//  Created by Nazar Petruk on 27/11/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit
import SceneKit


class PlanetPickerVC: UIViewController {
    
    var sceneView: SCNView!
    var size: CGSize!
    
    weak var planetPlacerVC : PlanetPlacerVC!
    
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
        view.layer.borderColor = #colorLiteral(red: 0.4438803196, green: 0.204872638, blue: 0.2166426182, alpha: 1)
        view.layer.borderWidth = 6.0
        view.layer.masksToBounds = true
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
        
        
        
        let sun = Planet.getSun()
        Planet.rotationAction(node: sun)
        scene.rootNode.addChildNode(sun)
        
        let mercury = Planet.getMercury()
        Planet.rotationAction(node: mercury)
        scene.rootNode.addChildNode(mercury)
        
        let venus = Planet.getVenus()
        Planet.rotationAction(node: venus)
        scene.rootNode.addChildNode(venus)
        
        let earth = Planet.getEarth()
        Planet.rotationAction(node: earth)
        scene.rootNode.addChildNode(earth)
        
        let mars = Planet.getMars()
        Planet.rotationAction(node: mars)
        scene.rootNode.addChildNode(mars)
        
        let jupiter = Planet.getJupiter()
        Planet.rotationAction(node: jupiter)
        scene.rootNode.addChildNode(jupiter)
        
        let saturn = Planet.getSaturn()
        Planet.rotationAction(node: saturn)
        scene.rootNode.addChildNode(saturn)
        
        let uranus = Planet.getUranus()
        Planet.rotationAction(node: uranus)
        scene.rootNode.addChildNode(uranus)
        
        let neptune = Planet.getNeptune()
        Planet.rotationAction(node: neptune)
        scene.rootNode.addChildNode(neptune)
        
        let pluto = Planet.getPluto()
        Planet.rotationAction(node: pluto)
        scene.rootNode.addChildNode(pluto)
    }
    
    @objc func handleTap (_ gestureRecognizer : UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        
        if hitResults.count > 0 {
            let node = hitResults[0].node
            planetPlacerVC.onPlanetSelected(node.name!)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}
