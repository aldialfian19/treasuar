//
//  levelOneVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit
import ARKit
import RealityKit

class LevelOneVC: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var robotEntity: Entity?
    var toyEntity: Entity?
    var startEntity: Entity?
    
    var moveToLocation: Transform = Transform()
    var moveDuration: Double = 2.00
    

    var currentPos: SIMD3<Float>?

    var floorEntitya1: Entity?
    var floorEntitya2: Entity?
    var floorEntitya3: Entity?
    var floorEntityb1: Entity?
    var floorEntityb2: Entity?
    var floorEntityb3: Entity?
    var floorEntityc1: Entity?
    var floorEntityc2: Entity?
    var floorEntityc3: Entity?
    
    var a1pos: SIMD3<Float> = simd_float3(x: 0, y: 0, z: 0)
    var a2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: 0)
    var a3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: 0)
    var a4pos: SIMD3<Float> = simd_float3(x: 0.6, y: 0, z: 0)
    var b1pos: SIMD3<Float> = simd_float3(x: 0.0, y: 0, z: 0.2)
    var b2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: 0.2)
    var b3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: 0.2)
    var b4pos: SIMD3<Float> = simd_float3(x: 0.6, y: 0, z: 0.2)
    var c1pos: SIMD3<Float> = simd_float3(x: 0, y: 0, z: 0.4)
    var c2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: 0.4)
    var c3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: 0.4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // start and initialize
        startARSession()
        
        //load 3d model
        robotEntity = try! Entity.load(named: "robot")
        toyEntity = try! Entity.load(named: "toy")
        startEntity = try! Entity.load(named: "merah")
        
        
        floorEntitya1 = try! Entity.load(named: "floor")
        floorEntitya2 = try! Entity.load(named: "floor")
        floorEntitya3 = try! Entity.load(named: "floor")
        floorEntityb1 = try! Entity.load(named: "floor")
        floorEntityb2 = try! Entity.load(named: "floor")
        floorEntityb3 = try! Entity.load(named: "floor")
        floorEntityc1 = try! Entity.load(named: "floor")
        floorEntityc2 = try! Entity.load(named: "floor")
        floorEntityc3 = try! Entity.load(named: "floor")
        
        
        
        
        //Tap detector
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
        
        //add button
        createdButton()
        
        move(direction: "")
        
        checkPoint()
    }
    
    @objc
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        //Tap location (2D Point) di layar
        let tapLocation = recognizer.location(in: arView)
        
        // mengubah titik 2D di layar menjadi titik 3D di reality
        let result = arView.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        
        // if plane detected
        if let firstResult = result.first {
//            print("\(firstResult)")
            
            // 3D position (detect koordinat x,y,z)
            let worldPos = simd_make_float3(firstResult.worldTransform.columns.3)
//            print("world\(worldPos)")
            
            
            
            // Place object
            placeObject(object: robotEntity!, position: worldPos)
            placeObject(object: toyEntity!, position: worldPos + a2pos)
            placeObject(object: startEntity!, position: worldPos)
            
            placeObject(object: floorEntitya1!, position: worldPos + a1pos)
            placeObject(object: floorEntitya2!, position: worldPos + a2pos)
            placeObject(object: floorEntitya3!, position: worldPos + a3pos)
            placeObject(object: floorEntityb1!, position: worldPos + b1pos)
            placeObject(object: floorEntityb2!, position: worldPos + b2pos)
            placeObject(object: floorEntityb3!, position: worldPos + b3pos)
            placeObject(object: floorEntityc1!, position: worldPos + c1pos)
            placeObject(object: floorEntityc2!, position: worldPos + c2pos)
            placeObject(object: floorEntityc3!, position: worldPos + c3pos)
            
            // Move Object
            move(direction: "")
            
            toyAnimation()
            
        }
    }
    
    func startARSession() {
        
        arView.automaticallyConfigureSession = true
        
        //Plane detection
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        configuration.environmentTexturing = .automatic
        
//        arView.debugOptions = .showAnchorGeometry
        arView.session.run(configuration)
        
    }
    
    func placeObject(object:Entity, position: SIMD3<Float>) {
        
        // 1. create anchor at 3D pos
        let objectAnchor = AnchorEntity(world: position)
        
        // 2. Tie model to anchor
        objectAnchor.addChild(object)
        
        // 3. Anchor to scene
        arView.scene.addAnchor(objectAnchor)
    }
    
    //MARK: -Object movement
    
    func move (direction: String) {
        
    
        
        switch direction {
            
            
            case "forward":
            
            moveToLocation.translation = (robotEntity?.transform.translation)! + simd_float3 (x: 0, y: 0, z: 20)
            robotEntity?.move(to: moveToLocation, relativeTo: robotEntity, duration: moveDuration)
            walkAnimation(moveDuration: moveDuration)
            
            
            case "left":
            //create sudut berputar
            let rotateAngle = simd_quatf(angle: GLKMathDegreesToRadians(90), axis: SIMD3(x: 0, y: 1, z: 0))
            robotEntity?.setOrientation(rotateAngle, relativeTo: robotEntity)
            
            
            case "right":
            //create sudut berputar
            let rotateAngle = simd_quatf(angle: GLKMathDegreesToRadians(270), axis: SIMD3(x: 0, y: 1, z: 0))
            robotEntity?.setOrientation(rotateAngle, relativeTo: robotEntity)
            
        default:
            print("No Movement")
            
        }
    }
    
    func walkAnimation(moveDuration: Double) {
        
        //USDZ Animation
        if let robotAnimation = robotEntity?.availableAnimations.first {
            
            //Play the animation
            robotEntity?.playAnimation(robotAnimation.repeat(duration: moveDuration), transitionDuration: 0.5, startsPaused: false)
            
        }else {
            print("No Animation Available")
        }
    }
    
    func toyAnimation(){
        toyEntity?.availableAnimations.forEach{
            toyEntity?.playAnimation($0.repeat())
        }
    }
    
    //MARK: - cek posisi robot
    func checkPoint(){
        
        guard let robotEntity = robotEntity else {
            return
        }
        let roundedValue1 = (robotEntity.position.x * 10).rounded() / 10
        let roundedValue2 = (robotEntity.position.z * 10).rounded() / 10
        
        if roundedValue1 == 0.0 && roundedValue2 == 0.0{
            print("robot in a1")
        }else if roundedValue1 == 0.0 && roundedValue2 == 0.2 {
            robotEntity.position = ((startEntity?.position)! + b1pos)
            print("robot in b1")
        }else if roundedValue1 == 0.0 && roundedValue2 == 0.4 {
            routeToSucces()
            robotEntity.position = ((startEntity?.position)! + c1pos)
            print("robot in c1")
        }else {
            routeToFalse()
            print("no point")
        }
        
        
    }
    
    //MARK: -Create Button
    
    func createdButton() {
        
        let maju = UIButton(type: .system)
        maju.frame = CGRect(x: 0, y: 300, width: 80, height: 50)
        maju.backgroundColor = .blue
        maju.setTitle("maju", for: .normal)
        maju.addTarget(self, action: #selector(majuAction), for: .touchUpInside)
        
        
        let kiri = UIButton(type: .system)
        kiri.frame = CGRect(x: 180, y: 300, width: 80, height: 50)
        kiri.backgroundColor = .blue
        kiri.setTitle("kiri", for: .normal)
        kiri.addTarget(self, action: #selector(kiriAction), for: .touchUpInside)
        
        let kanan = UIButton(type: .system)
        kanan.frame = CGRect(x: 270, y: 300, width: 80, height: 50)
        kanan.backgroundColor = .blue
        kanan.setTitle("kanan", for: .normal)
        kanan.addTarget(self, action: #selector(kananAction), for: .touchUpInside)
        
        
        
        self.view.addSubview(maju)
        self.view.addSubview(kiri)
        self.view.addSubview(kanan)
    }
    
    @objc func majuAction(sender: UIButton!) {
        
        move(direction: "forward")
        checkPoint()
        print("maju")
    }
    @objc func kiriAction(sender: UIButton!) {
        move(direction: "left")
        checkPoint()
        print("kiri")
    }
    @objc func kananAction(sender: UIButton!) {
        move(direction: "right")
        checkPoint()
        print("kanan")
    }
    
    // MARK: -pop up
    func routeToFalse() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let falseVC = arFailedVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = falseVC
        }, completion: nil)
    }
    
    func routeToMain() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let mainVC = arMainVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = mainVC
        }, completion: nil)
    }
    
    func routeToSucces() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let succedVC = arSuccesVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = succedVC
        }, completion: nil)
    }
}
