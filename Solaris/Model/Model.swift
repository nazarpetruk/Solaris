//
//  Model.swift
//  Solaris
//
//  Created by Nazar Petruk on 28/11/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import Foundation
import SceneKit



class Ramp {
    
    class func getRampForName(rampName: String) -> SCNNode{
        switch rampName {
        case "sun":
            return Ramp.getSun()
        case "mercury":
            return Ramp.getVenus()
        case "venus":
            return Ramp.getMercury()
        case "earth":
            return Ramp.getEarth()
        case "mars":
            return Ramp.getMars()
        default :
            return Ramp.getSun()
        }
    }
    
    class func getSun() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/sun.scn")
        let node = obj?.rootNode.childNode(withName: "sun", recursively: true)!
        node?.scale = SCNVector3Make(0.04, 0.04, 0.04)
        node?.position = SCNVector3Make(1, 0.8, -1)
        return node!
    }
    
    class func getMercury() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/mercury.scn")
        let node = obj?.rootNode.childNode(withName: "mercury", recursively: true)!
        node?.scale = SCNVector3Make(0.014, 0.014, 0.014)
        node?.position = SCNVector3Make(1, 0.22, -1)
        return node!
    }
    
    class func getVenus() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/venus.scn")
        let node = obj?.rootNode.childNode(withName: "venus", recursively: true)!
        node?.scale = SCNVector3Make(0.04, 0.04, 0.04)
        node?.position = SCNVector3Make(1, -0.05, -1)
        return node!
    }
    
    class func getEarth() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/earth.scn")
        let node = obj?.rootNode.childNode(withName: "earth", recursively: true)!
        node?.scale = SCNVector3Make(0.03, 0.03, 0.03)
        node?.position = SCNVector3Make(1, -0.5, -1)
        return node!
    }
    
    class func getMars() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/mars.scn")
        let node = obj?.rootNode.childNode(withName: "mars", recursively: true)!
        node?.scale = SCNVector3Make(0.007, 0.007, 0.007)
        node?.position = SCNVector3Make(1, -1, -1)
        return node!
    }
    
    class func getJupiter() -> SCNNode {
           let obj = SCNScene(named: "art.scnassets/jupiter.dae")
           let node = obj?.rootNode.childNode(withName: "jupiter", recursively: true)!
           node?.scale = SCNVector3Make(0.003, 0.003, 0.003)
           node?.position = SCNVector3Make(1, -2, -1)
           return node!
       }
    
    
    class func rotationAction(node: SCNNode){
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        node.runAction(rotate)
    }
}
