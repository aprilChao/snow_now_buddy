//
//  ShapeType.swift
//  Shape Dropper (Placenote SDK iOS Sample)
//
//  Created by Prasenjit Mukherjee on 2017-08-27.
//  Copyright © 2017 Vertical AI. All rights reserved.
//

import Foundation
import SceneKit

public enum ShapeType:Int {
    
    case Box = 0
    case Sphere
    case Pyramid
    case Torus
    case Capsule
    case Cylinder
    case Cone
    case Tube
    case Arrow
    
    static func random() -> ShapeType {
        let maxValue = Tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue+1))
        return ShapeType(rawValue: Int(rand))!
    }
    
    static func genSphere() -> ShapeType {
        return ShapeType(rawValue: Int(1))!
    }
    
    static func genArrow() -> ShapeType {
        return ShapeType(rawValue: Int(8))!
    }
    
    static func genPyramid() -> ShapeType {
        return ShapeType(rawValue: Int(2))!
    }
    static func genCone() -> ShapeType {
        return ShapeType(rawValue: Int(6))!
    }
    static func createArrow() -> SCNGeometry {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -0.5, y: 0.15))
        path.addLine(to: CGPoint(x: 0.1, y: 0.15))
        path.addLine(to: CGPoint(x: 0.1, y: 0.45))
        path.addLine(to: CGPoint(x: 0.5, y: 0))
        path.addLine(to: CGPoint(x: 0.1, y: -0.45))
        path.addLine(to: CGPoint(x: 0.1, y: -0.15))
        path.addLine(to: CGPoint(x: -0.5, y: -0.15))
        path.addLine(to: CGPoint(x: -0.5, y: 0.15))
        path.lineWidth = 4
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.close()
        
        let shape = SCNShape(path: path, extrusionDepth: 0.4)
        let color = UIColor.yellow
        shape.firstMaterial?.diffuse.contents = color
        shape.chamferRadius = 0.1
        return shape

    }
    
    static func generateGeometry(s_type:ShapeType) -> SCNGeometry {
        
        let geometry: SCNGeometry
        
        switch s_type {
        case ShapeType.Sphere: //
            geometry = SCNSphere(radius: 0.8)
        case ShapeType.Capsule:
            geometry = SCNCapsule(capRadius:0.5, height:1.0)
        case ShapeType.Cone:
            geometry = SCNCone(topRadius:0, bottomRadius:0.5, height:1.0)
        case ShapeType.Cylinder:
            geometry = SCNCylinder(radius:0.5, height:1.0)
        case ShapeType.Pyramid:
            geometry = SCNPyramid(width:1.5, height:2, length:1.5)
        case ShapeType.Torus:
            geometry = SCNTorus(ringRadius:1.0, pipeRadius:0.1)
        case ShapeType.Arrow:
            geometry = createArrow()
        case ShapeType.Box: //
            fallthrough
        default:
            geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        }
        
        return geometry
    }
}

