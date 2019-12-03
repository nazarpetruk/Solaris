//
//  ViewController.swift
//  Solaris
//
//  Created by Nazar Petruk on 27/11/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class PlanetPlacerVC: UIViewController, ARSCNViewDelegate, UIPopoverPresentationControllerDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var BtnStackView: UIStackView!
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var rotateBtn: UIButton!
    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var downBtn: UIButton!
    
    //MARK: VARs
    var objectName : String?
    var selectedObject : SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = false
        let scene = SCNScene(named: "art.scnassets/MainScene.scn")!
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = scene
        
        let gesture1 = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressed))
        let gesture2 = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressed))
        let gesture3 = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressed))
        
        gesture3.minimumPressDuration = 0.1
        gesture1.minimumPressDuration = 0.1
        gesture2.minimumPressDuration = 0.1
        rotateBtn.addGestureRecognizer(gesture1)
        upBtn.addGestureRecognizer(gesture2)
        downBtn.addGestureRecognizer(gesture3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    func session(_ session: ARSession, didFailWithError error: Error) {}
    
    func sessionWasInterrupted(_ session: ARSession) {}
    
    func sessionInterruptionEnded(_ session: ARSession) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let results = sceneView.hitTest(touch.location(in: sceneView), types: [.featurePoint])
        guard  let hitFeature = results.last else { return }
        let hitTransform = SCNMatrix4(hitFeature.worldTransform)
        let hitPosition = SCNVector3Make(hitTransform.m41
            , hitTransform.m42, hitTransform.m43)
        placePlanet(position: hitPosition)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    @IBAction func planetBtnPressed(_ sender: UIButton) {
        let planetPicker = PlanetPickerVC(size: CGSize(width: 300, height: 700))
        planetPicker.planetPlacerVC = self
        planetPicker.modalPresentationStyle = .popover
        planetPicker.popoverPresentationController?.delegate = self
        present(planetPicker, animated: true, completion: nil)
        planetPicker.popoverPresentationController?.sourceView = sender
        planetPicker.popoverPresentationController?.sourceRect = sender.bounds
    }
    
    func onPlanetSelected(_ planetName: String) {
            objectName = planetName
    }
    
    func placePlanet(position: SCNVector3) {
        if let planetName = objectName {
            BtnStackView.isHidden = false
            let planet = Planet.getPlanetByName(planetName: planetName)
            selectedObject = planet
            planet.position = position
            planet.scale = SCNVector3Make(0.01, 0.01, 0.01)
            sceneView.scene.rootNode.addChildNode(planet)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        if let object = selectedObject {
            object.removeFromParentNode()
            selectedObject = nil
        }
    }
    
    @objc func onLongPressed(gesture: UILongPressGestureRecognizer) {
        if let planet = selectedObject{
            if gesture.state == .ended {
                planet.removeAllActions()
            }else if gesture.state == .began {
                if gesture.view === rotateBtn {
                    let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.08 * Double.pi), z: 0, duration: 0.1))
                    planet.runAction(rotate)
                }else if gesture.view === upBtn{
                    let move = SCNAction.repeatForever(SCNAction.moveBy(x: 0, y: 0.08, z: 0, duration: 0.1))
                    planet.runAction(move)
                }else if gesture.view === downBtn {
                     let move = SCNAction.repeatForever(SCNAction.moveBy(x: 0, y: -0.08, z: 0, duration: 0.1))
                     planet.runAction(move)
                }
            }
        }
    }
}
