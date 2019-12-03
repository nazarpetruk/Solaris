//
//  Model.swift
//  Solaris
//
//  Created by Nazar Petruk on 28/11/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import Foundation
import SceneKit



class Planet {
    
    class func getPlanetByName(planetName: String) -> SCNNode{
        switch planetName {
        case "sun":
            return Planet.getSun()
        case "mercury":
            return Planet.getVenus()
        case "venus":
            return Planet.getMercury()
        case "earth":
            return Planet.getEarth()
        case "mars":
            return Planet.getMars()
        case "jupiter":
            return Planet.getJupiter()
        case "saturn":
            return Planet.getSaturn()
        case "uranus":
            return Planet.getUranus()
        case "neptune":
            return Planet.getNeptune()
        case "pluto":
            return Planet.getPluto()
        default :
            return Planet.getSaturn()
        }
    }
    
    class func getSun() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/sun.scn")
        let node = obj?.rootNode.childNode(withName: "sun", recursively: true)!
        node?.scale = SCNVector3Make(0.03, 0.03, 0.03)
        node?.position = SCNVector3Make(0.5, 0.9, -0.1)
        return node!
    }
    
    class func getMercury() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/mercury.scn")
        let node = obj?.rootNode.childNode(withName: "mercury", recursively: true)!
        node?.scale = SCNVector3Make(0.012, 0.012, 0.012)
        node?.position = SCNVector3Make(0.4, 1.1, -1)
        return node!
    }
    
    class func getVenus() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/venus.scn")
        let node = obj?.rootNode.childNode(withName: "venus", recursively: true)!
        node?.scale = SCNVector3Make(0.06, 0.06, 0.06)
        node?.position = SCNVector3Make(0.4, 0.86, -1)
        return node!
    }
    
    class func getEarth() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/earth.scn")
        let node = obj?.rootNode.childNode(withName: "earth", recursively: true)!
        node?.scale = SCNVector3Make(0.03, 0.03, 0.03)
        node?.position = SCNVector3Make(0.4, 0.5, -1)
        return node!
    }
    
    class func getMars() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/mars.scn")
        let node = obj?.rootNode.childNode(withName: "mars", recursively: true)!
        node?.scale = SCNVector3Make(0.006, 0.006, 0.006)
        node?.position = SCNVector3Make(0.5, 0, -1)
        return node!
    }
    
    class func getJupiter() -> SCNNode {
           let obj = SCNScene(named: "art.scnassets/jupiter.dae")
           let node = obj?.rootNode.childNode(withName: "jupiter", recursively: true)!
           node?.scale = SCNVector3Make(0.35, 0.35, 0.35)
           node?.position = SCNVector3Make(0.5, -0.7, -1)
           return node!
       }
    
    class func getSaturn() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/saturn.scn")
        let node = obj?.rootNode.childNode(withName: "saturn", recursively: true)!
        node?.scale = SCNVector3Make(0.002, 0.002, 0.002)
        node?.position = SCNVector3Make(0.4, -1.7, -1)
        return node!
    }
    
    class func getUranus() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/uranus.scn")
        let node = obj?.rootNode.childNode(withName: "uranus", recursively: true)!
        node?.scale = SCNVector3Make(0.0007, 0.0007, 0.0007)
        node?.position = SCNVector3Make(0.3, -2.5, -1)
        return node!
    }
    
    class func getNeptune() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/neptune.scn")
        let node = obj?.rootNode.childNode(withName: "neptune", recursively: true)!
        node?.scale = SCNVector3Make(0.001, 0.001, 0.001)
        node?.position = SCNVector3Make(1.5, -3, -0.7)
        return node!
    }
    
    class func getPluto() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/pluto.scn")
        let node = obj?.rootNode.childNode(withName: "pluto", recursively: true)!
        node?.scale = SCNVector3Make(0.1, 0.1, 0.1)
        node?.position = SCNVector3Make(1.5, -2.3, -0.7)
        return node!
    }
    
    
    class func rotationAction(node: SCNNode){
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        node.runAction(rotate)
    }
}
