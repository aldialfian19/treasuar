//
//  LevelSatuVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 23/11/22.
//

import UIKit

class LevelSatuVC: UIViewController {
    
    @IBOutlet var upButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    @IBOutlet var trashButton: UIButton!
    @IBOutlet var majuInstruksi: UIImageView!
    
    var action = ["forward", "forward", "left", "forward"]
    
    var robot: UIImageView?
    
    var c3loc: CGRect = CGRect(x: 780, y: 700, width: 178, height: 178)
    var c2loc: CGRect = CGRect(x: 600, y: 700, width: 178, height: 178)
    var c1loc: CGRect = CGRect(x: 420, y: 700, width: 178, height: 178)
    var b3loc: CGRect = CGRect(x: 780, y: 520, width: 178, height: 178)
    var b2loc: CGRect = CGRect(x: 600, y: 520, width: 178, height: 178)
    var b1loc: CGRect = CGRect(x: 420, y: 520, width: 178, height: 178)
    var a3loc: CGRect = CGRect(x: 780, y: 340, width: 178, height: 178)
    var a2loc: CGRect = CGRect(x: 600, y: 340, width: 178, height: 178)
    var a1loc: CGRect = CGRect(x: 420, y: 340, width: 178, height: 178)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        majuInstruksi.isHidden = false
        
        addRectangle()
        addImage()
        move(direction: "")
        
        
        
    }
    func addRectangle() {
        let a1tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        a1tile.frame = a1loc
        self.view.addSubview(a1tile)
        //        self.view.bringSubviewToFront(a1tile)
        
        let a2tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        a2tile.frame = a2loc
        self.view.addSubview(a2tile)
        
        let a3tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        a3tile.frame = a3loc
        self.view.addSubview(a3tile)
        
        let b1tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        b1tile.frame = b1loc
        self.view.addSubview(b1tile)
        
        let b2tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        b2tile.frame = b2loc
        self.view.addSubview(b2tile)
        
        let b3tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        b3tile.frame = b3loc
        self.view.addSubview(b3tile)
        
        let c1tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        c1tile.frame = c1loc
        self.view.addSubview(c1tile)
        
        let c2tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        c2tile.frame = c2loc
        self.view.addSubview(c2tile)
        
        let c3tile = UIImageView(image: UIImage(named: "tile2d.png")!)
        c3tile.frame = c3loc
        self.view.addSubview(c3tile)
        
        
        
    }
    
    func addImage() {
        robot = UIImageView(image: UIImage(named: "2.png"))
        robot!.frame = a1loc
        self.view.addSubview(robot!)
        self.view.bringSubviewToFront(robot!)
        
        self.view.addSubview(majuInstruksi!)
        self.view.bringSubviewToFront(majuInstruksi!)
        
    }
    func removeImage() {
        majuInstruksi.isHidden = true
    }
    
    
    //MARK: -Object movement
    
    func move (direction: String)  {
//        let robotpos = robot!.frame
        var result: CGRect?
        switch direction {
            
        case "forward":
          
            if robot?.image == UIImage(named: "2.png") {
                UIView.animate(
                    withDuration: 2, delay: 0, usingSpringWithDamping: 1.9, initialSpringVelocity: 3.0, options: [], animations: {
                        self.robot?.transform = (self.robot?.transform.translatedBy(x: 0, y: 180))!
                        
                    })
                
            }else if self.robot?.image == UIImage(named: "1.png") {
                UIView.animate(
                    withDuration: 2, delay: 0, usingSpringWithDamping: 1.9, initialSpringVelocity: 3.0, options: [], animations: {
                        self.robot?.transform = (self.robot?.transform.translatedBy(x: 180, y: 0))!
                        
                    })
            }

            
        case "left":
            if robot?.image == UIImage(named: "2.png"){
                self.robot?.image = UIImage(named: "1.png")
            }else if robot?.image == UIImage(named: "3.png"){
                self.robot?.image = UIImage(named: "2.png")
            }
            
        case "right":
            if robot?.image == UIImage(named: "2.png"){
                self.robot?.image = UIImage(named: "3.png")
            }else if robot?.image == UIImage(named: "1.png"){
                self.robot?.image = UIImage(named: "2.png")
            }
            
        case "restart":
            self.robot?.image = UIImage(named: "2.png")
            self.robot?.frame = a1loc

            
        default:
            result = robot?.frame
        }
    }
    
    //MARK: -button
    
    @IBAction func oneAction(_ sender: Any) {
        move(direction: "forward")
        removeImage()

    }
    @IBAction func leftAction(_ sender: Any) {
        move(direction: "left")
    }
    
    @IBAction func rightAction(_ sender: Any) {
        move(direction: "right")
    }
    
    @IBAction func restartAction(_ sender: Any) {
        move(direction: "restart")
    }
    
    @IBAction func homeAction(_ sender: Any) {
    }
    
    //MARK: -Checkpoint
    func checkPoint() {
        let robotPosition = robot?.frame
        
        if robotPosition == a1loc {
            majuInstruksi.isHidden = false
            print("robot in a1")
        }else if robotPosition == a2loc{
            print("robot in a2")
        }else if robotPosition == b1loc{
            print("robot in b1")
        }else if robotPosition == b2loc{
            print("robot in b2")
        }else if robotPosition == c1loc{
            print("robot in c1")
        }else if robotPosition == c2loc{
            print("robot in c2")
        }else if robotPosition == c3loc{
            print("robot in c3")
        }else {
            print("no point")
        }
    }
    
}
