//
//  levelTwoVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit
import RealityKit
import ARKit

class LevelTwoVC: UIViewController {

    @IBOutlet var arView: ARView!
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var trashButton: UIButton!
    
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    @IBOutlet var failedView: UIView!
    @IBOutlet var instruksiSatu: UIImageView!
    @IBOutlet var instruksiDua: UIImageView!
    
    
    var robotEntity: Entity?
    
    var toyEntity: Entity?
    
    var startEntity: Entity?
    
    var moveToLocation: Transform = Transform()
    var moveDuration: Double = 2.00
    

    var currentPos: SIMD3<Float>?

    var floorEntitya1: Entity?
    var floorEntitya2: Entity?
    var floorEntitya3: Entity?
    var floorEntitya4: Entity?
    var floorEntitya6: Entity?
    
    var floorEntityb1: Entity?
    var floorEntityb2: Entity?
    var floorEntityb3: Entity?
    var floorEntityb4: Entity?
    var floorEntityb6: Entity?
    
    var floorEntityc1: Entity?
    var floorEntityc2: Entity?
    var floorEntityc3: Entity?
    var floorEntityc4: Entity?
    var floorEntityc6: Entity?
    
    var floorEntityd1: Entity?
    var floorEntityd2: Entity?
    var floorEntityd3: Entity?
    var floorEntityd4: Entity?
    var floorEntityd6: Entity?
    
    var floorEntityz1: Entity?
    var floorEntityz2: Entity?
    var floorEntityz3: Entity?
    var floorEntityz4: Entity?
    var floorEntityz6: Entity?
    
    var coinEntity: Entity?
    
    var a1pos: SIMD3<Float> = simd_float3(x: 0, y: 0, z: 0)
    var a2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: 0)
    var a3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: 0)
    var a4pos: SIMD3<Float> = simd_float3(x: 0.6, y: 0, z: 0)
    
    var b1pos: SIMD3<Float> = simd_float3(x: 0, y: 0, z: 0.2)
    var b2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: 0.2)
    var b3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: 0.2)
    var b4pos: SIMD3<Float> = simd_float3(x: 0.6, y: 0, z: 0.2)
    
    var c1pos: SIMD3<Float> = simd_float3(x: 0, y: 0, z: 0.4)
    var c2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: 0.4)
    var c3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: 0.4)
    var c4pos: SIMD3<Float> = simd_float3(x: 0.6, y: 0, z: 0.4)
    
    var d1pos: SIMD3<Float> = simd_float3(x: 0, y: 0, z: 0.6)
    var d2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: 0.6)
    var d3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: 0.6)
    var d4pos: SIMD3<Float> = simd_float3(x: 0.6, y: 0, z: 0.6)
    
    var z1pos: SIMD3<Float> = simd_float3(x: 0, y: 0, z: -0.2)
    var z2pos: SIMD3<Float> = simd_float3(x: 0.2, y: 0, z: -0.2)
    var z3pos: SIMD3<Float> = simd_float3(x: 0.4, y: 0, z: -0.2)
    var z4pos: SIMD3<Float> = simd_float3(x: 0.6, y: 0, z: -0.2)
    
    var z6pos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: -0.2)
    var a6pos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0)
    var b6pos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0.2)
    var c6pos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0.4)
    var d6pos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0.6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // start and initialize
        startARSession()
        
        //load 3d model
        robotEntity = try! Entity.load(named: "robot")
        startEntity = try! Entity.load(named: "merah")
        coinEntity = try! Entity.load(named: "koin")
        
        
        //load pagar
        
        floorEntityz1 = try! Entity.load(named: "balok")
        floorEntityz2 = try! Entity.load(named: "balok")
        floorEntityz3 = try! Entity.load(named: "balok")
        floorEntityz4 = try! Entity.load(named: "balok")
        floorEntityz6 = try! Entity.load(named: "balok")
        
        floorEntitya6 = try! Entity.load(named: "balok")
        floorEntityb6 = try! Entity.load(named: "balok")
        floorEntityc6 = try! Entity.load(named: "balok")
        floorEntityd6 = try! Entity.load(named: "balok")
        
        floorEntitya4 = try! Entity.load(named: "balok")
        floorEntityb4 = try! Entity.load(named: "balok")
        floorEntityc4 = try! Entity.load(named: "balok")
        
        floorEntityd1 = try! Entity.load(named: "balok")
        floorEntityd2 = try! Entity.load(named: "balok")
        floorEntityd3 = try! Entity.load(named: "balok")
        floorEntityd4 = try! Entity.load(named: "balok")
        
        
        //load tile
        floorEntitya1 = try! Entity.load(named: "grass")
        floorEntitya2 = try! Entity.load(named: "balok")
        floorEntitya3 = try! Entity.load(named: "grass")
        
        
        floorEntityb1 = try! Entity.load(named: "grass")
        floorEntityb2 = try! Entity.load(named: "grass")
        floorEntityb3 = try! Entity.load(named: "balok")
        
        
        floorEntityc1 = try! Entity.load(named: "balok")
        floorEntityc2 = try! Entity.load(named: "grass")
        floorEntityc3 = try! Entity.load(named: "grass")
        
        
        
        
        //Tap detector
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
        
        move(direction: "")
        
        checkPoint()
        
        failedView.isHidden = true
        instruksiSatu.isHidden = true
        
    }
    
    //MARK: -Load Object
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
            
//            print("\(a2pos)")
            
            
            // Place object
            placeObject(object: robotEntity!, position: worldPos)
            placeObject(object: startEntity!, position: worldPos)
            placeObject(object: coinEntity!, position: worldPos + simd_float3(x: 0.4, y: 0.02, z: 0.4))
            
            placeObject(object: floorEntitya1!, position: worldPos + a1pos)
            placeObject(object: floorEntitya2!, position: worldPos + a2pos)
            placeObject(object: floorEntitya3!, position: worldPos + a3pos)
            placeObject(object: floorEntitya4!, position: worldPos + a4pos)
            placeObject(object: floorEntitya6!, position: worldPos + a6pos)
            
            placeObject(object: floorEntityb1!, position: worldPos + b1pos)
            placeObject(object: floorEntityb2!, position: worldPos + b2pos)
            placeObject(object: floorEntityb3!, position: worldPos + b3pos)
            placeObject(object: floorEntityb4!, position: worldPos + b4pos)
            placeObject(object: floorEntityb6!, position: worldPos + b6pos)
            
            placeObject(object: floorEntityc1!, position: worldPos + c1pos)
            placeObject(object: floorEntityc2!, position: worldPos + c2pos)
            placeObject(object: floorEntityc3!, position: worldPos + c3pos)
            placeObject(object: floorEntityc4!, position: worldPos + c4pos)
            placeObject(object: floorEntityc6!, position: worldPos + c6pos)
            
            placeObject(object: floorEntityd1!, position: worldPos + d1pos)
            placeObject(object: floorEntityd2!, position: worldPos + d2pos)
            placeObject(object: floorEntityd3!, position: worldPos + d3pos)
            placeObject(object: floorEntityd4!, position: worldPos + d4pos)
            placeObject(object: floorEntityd6!, position: worldPos + d6pos)
            
            placeObject(object: floorEntityz1!, position: worldPos + z1pos)
            placeObject(object: floorEntityz2!, position: worldPos + z2pos)
            placeObject(object: floorEntityz3!, position: worldPos + z3pos)
            placeObject(object: floorEntityz4!, position: worldPos + z4pos)
            placeObject(object: floorEntityz6!, position: worldPos + z6pos)
            
            // Move Object
//            move(direction: "")
            
            toyAnimation()
            
            instruksiDua.isHidden = true
            instruksiSatu.isHidden = false
            
        }
    }
    
    //MARK: -SETTING AR
    
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
            let rotateAngle = simd_quatf(angle: GLKMathDegreesToRadians(90), axis: SIMD3(x: 0, y: -1, z: 0))
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
    
    func delay(_ delay:Double, closure:@escaping () -> ()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    //MARK: -CHECKPOINT
    
    // cek posisi robot
    func checkPoint(){
        
        guard let robotEntity = robotEntity else {
            return
        }
        let roundedValue1 = (robotEntity.position.x * 10).rounded() / 10
        let roundedValue2 = (robotEntity.position.z * 10).rounded() / 10
        
        if roundedValue1 == 0.0 && roundedValue2 == 0.0{
            print("robot in a1")
        }else if roundedValue1 == 0.0 && roundedValue2 == 0.2 {
            print("robot in b1")
        }else if roundedValue1 == 0.2 && roundedValue2 == 0.2 {
            print("robot in b2")
        }else if roundedValue1 == 0.2 && roundedValue2 == 0.4 {
            print("robot in c2")
        }else if roundedValue1 == 0.4 && roundedValue2 == 0.0 {
            print("robot in a3")
        }else if roundedValue1 == 0.4 && roundedValue2 == 0.4 {
            routeToSucces()
            print("robot in c3")
        }else {
            failedView.isHidden = false
            print("no point")
        }
        
        
        
        
    }
    
    //MARK: -Create Button
    
    @IBAction func forwardAction(_ sender: Any) {
        move(direction: "forward")
        delay(2) {
             self.checkPoint()
         }
    }
    
    @IBAction func leftAction(_ sender: Any) {
        move(direction: "left")
        print("kiri")
    }
    
    @IBAction func rightAction(_ sender: Any) {
            move(direction: "right")
            print("kanan")
    }

    @IBAction func trashAction(_ sender: Any) {
        robotEntity?.orientation = (startEntity?.orientation)!
        robotEntity?.position = (startEntity?.position)!
        
    }
    
    @IBAction func homeAction(_ sender: Any) {
        routeToMain()
    }
    
    @IBAction func ulangiAction(_ sender: Any) {
        robotEntity?.orientation = (startEntity?.orientation)!
        robotEntity?.position = (startEntity?.position)!
        
        failedView.isHidden = true
    }
    
    //MARK: -route to popup
    func routeToFalse() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let falseVC = arFailedVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = falseVC
        }, completion: nil)
    }
    
    func routeToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.modalPresentationStyle = .fullScreen
        self.present(ViewController, animated: false, completion: nil)
    }
    
    func routeToSucces() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let succedVC = arSuccessDua()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = succedVC
        }, completion: nil)
    }

}

