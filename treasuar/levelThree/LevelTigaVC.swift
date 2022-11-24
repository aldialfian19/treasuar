//
//  LevelTigaVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 24/11/22.
//

import UIKit

class LevelTigaVC: UIViewController {
    
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var trashButton: UIButton!
    @IBOutlet var runButton: UIButton!
    
    var robot: UIImageView?
    var action = ["kosong","forward", "forward", "left", "forward"]
    
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
        
        addRectangle()
        addImage()
        move(direction: "")

        // Do any additional setup after loading the view.
    }
    //MARK: - load image
    
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
    }
    
    //MARK: -created movement
    
    func move (direction: String)  {

        var result: CGRect?
        switch direction {
            
        case "forward":
          
            if robot?.image == UIImage(named: "2.png") {
                self.robot?.transform = (self.robot?.transform.translatedBy(x: 0, y: 180))!
                
            }else if self.robot?.image == UIImage(named: "1.png") {
                self.robot?.transform = (self.robot?.transform.translatedBy(x: 180, y: 0))!
                
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
            
        case "kosong":
            result = robot?.frame

            
        default:
            result = robot?.frame
        }
    }
    // MARK: -run move
    func runMove() {
        UIView.animate(withDuration: 1, delay: 0) {
            self.move(direction: "\(self.action[0])")
        } completion: { isTrue in
            UIView.animate(withDuration: 1, delay: 0) {
                if self.action.count >= 2 {
                    self.move(direction: "\(self.action[1])")
                }else {
                    self.move(direction: "\(self.action[0])")
                }

            } completion: { isTrue2 in
                UIView.animate(withDuration: 1, delay: 0) {
                    if self.action.count >= 3 {
                        self.move(direction: "\(self.action[2])")
                    }else {
                        self.move(direction: "\(self.action[0])")
                    }

                } completion: { isTrue3 in
                    UIView.animate(withDuration: 1, delay: 0) {
                        if self.action.count >= 4 {
                            self.move(direction: "\(self.action[3])")
                        }else {
                            self.move(direction: "\(self.action[0])")
                        }

                    } completion: { isTrue4 in
                        UIView.animate(withDuration: 1, delay: 0) {
                            if self.action.count >= 5 {
                                self.move(direction: "\(self.action[4])")
                            }else {
                                self.move(direction: "\(self.action[0])")
                            }
                        } completion: { isTrue5 in
                            UIView.animate(withDuration: 1, delay: 0) {
                                if self.action.count >= 6 {
                                    self.move(direction: "\(self.action[5])")
                                }else {
                                    self.move(direction: "\(self.action[0])")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
// MARK: -Created button
    
    @IBAction func forwardAction(_ sender: Any) {
    }
    @IBAction func leftAction(_ sender: Any) {
    }
    @IBAction func rightAction(_ sender: Any) {
    }
    @IBAction func trashAction(_ sender: Any) {
    }
    @IBAction func runAction(_ sender: Any) {
        runMove()
    }
}
