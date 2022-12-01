//
//  levelThreeVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit
import ARKit
import RealityKit

class LevelFiveVC: UIViewController {

    @IBOutlet var arView: ARView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var runButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var loopButton: UIButton!
    
    
    @IBOutlet var instruksiSatu: UIImageView!
    @IBOutlet var instruksiDua: UIImageView!
    
    @IBOutlet var failedView: UIView!
    
    
    
    var actionRobot = ["kosong"]
    var actionBox = [""]
    
    var robotEntity: Entity?
    
    var toyEntity: Entity?
    
    var startEntity: Entity?
    
    var moveToLocation: Transform = Transform()
    var moveDuration: Double = 3.00
    

    var currentPos: SIMD3<Float>?

    var floorEntitya1: Entity?
    var floorEntitya2: Entity?
    var floorEntitya3: Entity?
    var floorEntitya4: Entity?
    var floorEntityb1: Entity?
    var floorEntityb2: Entity?
    var floorEntityb3: Entity?
    var floorEntityb4: Entity?
    var floorEntityc1: Entity?
    var floorEntityc2: Entity?
    var floorEntityc3: Entity?
    var floorEntityc4: Entity?
    
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
    
    var a5pos: SIMD3<Float> = simd_float3(x: 0.8, y: 0, z: 0)
    var b5pos: SIMD3<Float> = simd_float3(x: 0.8, y: 0, z: 0.2)
    var c5pos: SIMD3<Float> = simd_float3(x: 0.8, y: 0, z: 0.4)
    var d5pos: SIMD3<Float> = simd_float3(x: 0.8, y: 0, z: 0.6)
    
    var aMinPos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0)
    var bMinPos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0.2)
    var cMinPos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0.4)
    var dMinPos: SIMD3<Float> = simd_float3(x: -0.2, y: 0, z: 0.6)
    
    
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
        
        move(direction: "")
        
        failedView.isHidden = true
        tableView.isHidden = true
        instruksiSatu.isHidden = true
        
        loopButton.showsMenuAsPrimaryAction = true
        loopButton.menu = addMenu()
        
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
            
            instruksiDua.isHidden = true
            instruksiSatu.isHidden = false
            tableView.isHidden = false
            
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
            let rotateAngle = simd_quatf(angle: GLKMathDegreesToRadians(270), axis: SIMD3(x: 0, y: 1, z: 0))
            robotEntity?.setOrientation(rotateAngle, relativeTo: robotEntity)
            
            case "kosong":
            print("no move")
            
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
    
    func offButton() {
        
        if actionRobot.count >= 9 {
            forwardButton.isEnabled = false
            leftButton.isEnabled = false
            rightButton.isEnabled = false
        }
    }
    
    func onButton() {
        forwardButton.isEnabled = true
        leftButton.isEnabled = true
        rightButton.isEnabled = true
        runButton.isEnabled = true
    }
    
    func addMenu() -> UIMenu {


        let lima = UIAction(title: "Ulangi Maju 5 Kali") { action  in
                print("menu 1")
                self.actionRobot.append(contentsOf: ["forward","forward","forward","forward","forward"])
                self.actionBox.append("Ulangi Maju 4 Kali")
                self.tableView.reloadData()
                
            }
        let empat = UIAction(title: "Ulangi Maju 4 Kali") { action  in
                print("menu 2")
                self.actionRobot.append(contentsOf: ["forward","forward","forward","forward"])
                self.actionBox.append("Ulangi Maju 4 Kali")
                self.tableView.reloadData()
            }
        let tiga = UIAction(title: "Ulangi Maju 3 Kali"){ action  in
                print("menu 3")
                self.actionRobot.append(contentsOf: ["forward","forward","forward"])
                self.actionBox.append("Ulangi Maju 3 Kali")
                self.tableView.reloadData()
            }
        let menuItem = UIMenu(title: "", options: .displayInline, children: [tiga, empat, lima])
        
        return menuItem
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
        let succedVC = arSuccesVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = succedVC
        }, completion: nil)
    }

    
    //MARK: -CREATED BUTTON

    @IBAction func homeAction(_ sender: Any) {
        routeToMain()
    }
    
    @IBAction func ulangiAction(_ sender: Any) {
        robotEntity?.position = (startEntity?.position)!
        actionRobot.removeAll()
        actionRobot.append("kosong")
        actionBox.removeAll()
        actionBox.append("")
        
        tableView.reloadData()
        robotEntity?.orientation = (startEntity?.orientation)!
        
        
        onButton()
        
        failedView.isHidden = true
    }
    
    
    @IBAction func trashAction(_ sender: Any) {
        robotEntity?.position = (startEntity?.position)!
        actionRobot.removeAll()
        actionRobot.append("kosong")
        actionBox.removeAll()
        actionBox.append("")
        
        tableView.reloadData()
        robotEntity?.orientation = (startEntity?.orientation)!
        
        onButton()
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        actionRobot.append("forward")
        actionBox.append("Maju")
        
        tableView.reloadData()
        
        offButton()
        
    }
    
    @IBAction func leftAction(_ sender: Any) {
        actionRobot.append("left")
        actionBox.append("Balik Kiri")
        
        tableView.reloadData()
        
        offButton()
    }
    
    @IBAction func rightAction(_ sender: Any) {
        actionRobot.append("right")
        actionBox.append("Balik Kanan")
        
        tableView.reloadData()
        
        offButton()
    }
    
//    @IBAction func loopAction(_ sender: Any) {
//    }
    
    
    @IBAction func runAction(_ sender: Any) {
        runButton.isEnabled = false
        
        if actionRobot.count >= 2 {
            move(direction: "\(actionRobot[1])")
        }else {
            move(direction: "\(actionRobot[0])")
        }
        delay(2) {
            if self.actionRobot.count >= 3 {
                self.move(direction: "\(self.actionRobot[2])")
            }else {
                self.move(direction: "\(self.actionRobot[0])")
            }
            self.delay(2) {
                 self.checkPoint()
                self.delay(0.1) {
                    if self.actionRobot.count >= 4 {
                        self.move(direction: "\(self.actionRobot[3])")
                    }else {
                        self.move(direction: "\(self.actionRobot[0])")
                    }
                    self.delay(2) {
                         self.checkPoint()
                        self.delay(0.1) {
                            if self.actionRobot.count >= 5 {
                                self.move(direction: "\(self.actionRobot[4])")
                            }else {
                                self.move(direction: "\(self.actionRobot[0])")
                            }
                            self.delay(2) {
                                 self.checkPoint()
                                self.delay(0.1) {
                                    if self.actionRobot.count >= 6 {
                                        self.move(direction: "\(self.actionRobot[5])")
                                    }else {
                                        self.move(direction: "\(self.actionRobot[0])")
                                    }
                                    self.delay(2) {
                                         self.checkPoint()
                                        self.delay(0.1) {
                                            if self.actionRobot.count >= 7 {
                                                self.move(direction: "\(self.actionRobot[6])")
                                            }else {
                                                self.move(direction: "\(self.actionRobot[0])")
                                            }
                                            self.delay(2) {
                                                 self.checkPoint()
                                                self.delay(0.1) {
                                                    if self.actionRobot.count >= 8 {
                                                        self.move(direction: "\(self.actionRobot[7])")
                                                    }else {
                                                        self.move(direction: "\(self.actionRobot[0])")
                                                    }
                                                    self.delay(2) {
                                                         self.checkPoint()
                                                        self.delay(0.1) {
                                                            if self.actionRobot.count >= 9 {
                                                                self.move(direction: "\(self.actionRobot[8])")
                                                            }else {
                                                                self.move(direction: "\(self.actionRobot[0])")
                                                            }
                                                            self.delay(2) {
                                                                 self.checkPoint()
                                                             }
                                                         }
                                                     }
                                                 }
                                             }
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
             }
         }
    }
    
    func updateTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LevelTigaCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}


extension LevelFiveVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.actionBox.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as? LevelTigaCell {
            cell.cellLabel.text = self.actionBox[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
