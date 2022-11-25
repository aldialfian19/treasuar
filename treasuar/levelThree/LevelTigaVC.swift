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
    @IBOutlet var tableView: UITableView!
    
    var robot: UIImageView?
    var action = ["kosong"]
    var actionBox = [""]
    
    var c3loc: CGRect = CGRect(x: 1015.25, y: 602.25, width: 142.5, height: 142.5)
    var c2loc: CGRect = CGRect(x: 872.75, y: 602.25, width: 142.5, height: 142.5)
    var c1loc: CGRect = CGRect(x: 730.25, y: 602.25, width: 142.5, height: 142.5)
    var b3loc: CGRect = CGRect(x: 1015.25, y: 459.75, width: 142.5, height: 142.5)
    var b2loc: CGRect = CGRect(x: 872.75, y: 459.75, width: 142.5, height: 142.5)
    var b1loc: CGRect = CGRect(x: 730.25, y: 459.75, width: 142.5, height: 142.5)
    var a3loc: CGRect = CGRect(x: 1015.25, y: 317.25, width: 142.5, height: 142.5)
    var a2loc: CGRect = CGRect(x: 872.75, y: 317.25, width: 142.5, height: 142.5)
    var a1loc: CGRect = CGRect(x: 730.25, y: 317.25, width: 142.5, height: 142.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRectangle()
        addImage()
        move(direction: "")
        updateTable()
//        addActionImage()

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
    
    func addActionImage() {
        
       
    }
    
    //MARK: -created movement
    
    func move (direction: String)  {

        var result: CGRect?
        switch direction {
            
        case "forward":
          
            if robot?.image == UIImage(named: "2.png") {
                self.robot?.transform = (self.robot?.transform.translatedBy(x: 0, y: 142.5))!
                
            }else if self.robot?.image == UIImage(named: "1.png") {
                self.robot?.transform = (self.robot?.transform.translatedBy(x: 142.5, y: 0))!
                
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
            print("no move")
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
                            } completion: { isTrue6 in
                                UIView.animate(withDuration: 1, delay: 0) {
                                    if self.action.count >= 7 {
                                        self.move(direction: "\(self.action[6])")
                                    }else {
                                        self.move(direction: "\(self.action[0])")
                                    }
                                } completion: { isTrue7 in
                                    UIView.animate(withDuration: 1, delay: 0) {
                                        if self.action.count >= 8 {
                                            self.move(direction: "\(self.action[7])")
                                        }else {
                                            self.move(direction: "\(self.action[0])")
                                        }
                                    } completion: { isTrue8 in
                                        UIView.animate(withDuration: 1, delay: 0) {
                                            if self.action.count >= 9 {
                                                self.move(direction: "\(self.action[8])")
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
            }
        }
    }
// MARK: -Created button
    
    @IBAction func forwardAction(_ sender: Any) {
        action.append("forward")
        actionBox.append("Maju")
        
        tableView.reloadData()
//        addActionImage()
    }
    @IBAction func leftAction(_ sender: Any) {
        action.append("left")
        actionBox.append("Balik Kiri")
        
        tableView.reloadData()
//        addActionImage()
    }
    @IBAction func rightAction(_ sender: Any) {
        action.append("right")
        actionBox.append("Balik Kanan")
        
        tableView.reloadData()
//        addActionImage()
    }
    @IBAction func trashAction(_ sender: Any) {
        robot?.image = UIImage(named: "2.png")
        action.removeAll()
        action.append("kosong")
        actionBox.removeAll()
        actionBox.append("")
        
        tableView.reloadData()
        robot?.frame = a1loc
    }
    @IBAction func runAction(_ sender: Any) {
        
       runMove()
        if robot?.frame == c3loc {
            print("robot in c3")
            
        }else {
            self.robot?.frame = a1loc
            robot?.image = UIImage(named: "2.png")
            print("no point")
        }
        
    }
    @IBAction func homeAction(_ sender: Any) {
    }
    
    //MARK: -checkpoint
    func finishPoint() {
        var robotPosition = robot?.frame
        
        if robotPosition == c3loc {
            print("robot in c3")
            
        }else if robotPosition == b2loc {
            robotPosition = a1loc
            robot?.image = UIImage(named: "2.png")
            print("get point")
        }
    }
    
    //MARK: -Update cell
    
    func updateTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LevelTigaCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

extension LevelTigaVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.action.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as? LevelTigaCell {
            cell.cellLabel.text = self.actionBox[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
