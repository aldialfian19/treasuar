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
    @IBOutlet var runButton: UIButton!
    
    var action = ["forward", "forward", "left"]
    
    var robot: UIImageView?
    
    var a1loc: CGRect = CGRect(x: 780, y: 700, width: 178, height: 178)
    var a2loc: CGRect = CGRect(x: 600, y: 700, width: 178, height: 178)
    var a3loc: CGRect = CGRect(x: 420, y: 700, width: 178, height: 178)
    var b1loc: CGRect = CGRect(x: 780, y: 520, width: 178, height: 178)
    var b2loc: CGRect = CGRect(x: 600, y: 520, width: 178, height: 178)
    var b3loc: CGRect = CGRect(x: 420, y: 520, width: 178, height: 178)
    var c1loc: CGRect = CGRect(x: 780, y: 340, width: 178, height: 178)
    var c2loc: CGRect = CGRect(x: 600, y: 340, width: 178, height: 178)
    var c3loc: CGRect = CGRect(x: 420, y: 340, width: 178, height: 178)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRectangle()
        addImage()
        move(direction: "")
        //        yAnimate()
        
        
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
        robot = UIImageView(image: UIImage(named: "robot2d.png")!)
        robot!.frame = a1loc
        self.view.addSubview(robot!)
        self.view.bringSubviewToFront(robot!)
        
    }
    
    //MARK: -Object movement
    func move (direction: String) -> CGRect {
        let robotpos = robot!.frame
        var result: CGRect?
        switch direction {
            
        case "forward":
            //            UIView.animate(withDuration: 1.00, animations: {
            //                self.robot?.frame = self.b1loc
            //            })
            
            if robotpos == a1loc {
//                UIView.animate(withDuration: 1, delay: 0.5) {
//                    self.robot?.frame = self.b1loc
//                }
                result = self.b1loc
                
            }else if robotpos == b1loc {
//                UIView.animate(withDuration: 1.00, animations: {
//                    self.robot?.frame = self.c1loc
//                })
                result = self.c1loc
            }
            
        case "left":
            if robotpos == a1loc {
//                UIView.animate(withDuration: 1.00, animations: {
//                    self.robot?.frame = self.a2loc
//                })
                robot = UIImageView(image: UIImage(named: "Group.png")!)
                result = self.a1loc
                
//            }else if robotpos == b1loc {
//                UIView.animate(withDuration: 1.00, animations: {
//                    self.robot?.frame = self.b2loc
//                })
            }else if robotpos == c1loc {
//                UIView.animate(withDuration: 1.00, animations: {
//                    self.robot?.frame = self.c2loc
//                })
                result = self.c2loc
                
            }else if robotpos == c2loc {
//                UIView.animate(withDuration: 1.00, animations: {
//                    self.robot?.frame = self.c3loc
//                })
                result = self.c3loc
            }
            
        default:
            result = robot?.frame
        }
        return result ?? robot!.frame
    }
    
    //    func
    
    @IBAction func oneAction(_ sender: Any) {
        move(direction: "forward")
        //        action.append("forward")
        //        yAnimate()
    }
    @IBAction func leftAction(_ sender: Any) {
        move(direction: "left")
    }
    
    @IBAction func runAction(_ sender: Any) {
        //[1,2,3, 4,5] => 3 detik => 100%, 1-. index 0 -> 0; 2- index 1 -> 20/100 , [0.0, 0.3, 0.6]
        //0,1,2,3,4
        UIView.animateKeyframes(withDuration: Double(self.action.count), delay: 0.0, options: [], animations: {
            for (index, actionSheet) in self.action.enumerated() {
                UIView.addKeyframe(withRelativeStartTime: Double(index) * (1.0 / Double(self.action.count)), relativeDuration: 1, animations: {
                    //1.Expansion + button label alpha
                    self.robot?.frame = self.move(direction: actionSheet)
                })
                
            }
        }) { (completed) in
            //Completion of whole animation sequence
        }
        
        //        for actionSheet in action{
        //            UIView.animate(withDuration: 1, delay: 0) {
        //                self.robot?.frame = self.b1loc
        //            } completion: { isTrue in
        //                UIView.animate(withDuration: 1, delay: 0) {
        //                    self.robot?.frame = self.c1loc
        //                } completion: { isTrue2 in
        //                    UIView.animate(withDuration: 1, delay: 0) {
        //                        self.robot?.frame = self.c2loc
        //                    } completion: { isTrue3 in
        //
        //                    }
        //                }
        //            }
        
        //        }
        //        move(direction: "\(action.first ?? nil)")
        
        //        move(direction: "\(action[0])")
        //        move(direction: "\(action[1])")
        
        //        move(direction: "\(action[2] ?? nil)")
        
    }
    
    
}
