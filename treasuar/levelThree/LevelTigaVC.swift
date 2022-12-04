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
    
    @IBOutlet var failedView: UIView!
    @IBOutlet var ulangiButton: UIButton!
    
    
    var robot: UIImageView?
    var point: UIImageView?
    var actionRobot = ["kosong"]
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
    
    var tembokLoc: CGRect = CGRect(x: 634, y: 221, width: 613, height: 618)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRectangle()
        addImage()
        move(direction: "")
        updateTable()
        
        failedView.isHidden = true
        
        
        
        
//        runButton.isExclusiveTouch = false
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
        robot = UIImageView(image: UIImage(named: "depan.png"))
        robot!.frame = a1loc
        self.view.addSubview(robot!)
        self.view.bringSubviewToFront(robot!)
        
        let tembok = UIImageView(image: UIImage(named: "tembok.png")!)
        tembok.frame = tembokLoc
        self.view.addSubview(tembok)
        
        //obstacle
        let a2Obs = UIImageView(image: UIImage(named: "block.png")!)
        a2Obs.frame = a2loc
        self.view.addSubview(a2Obs)
        
        let c1Obs = UIImageView(image: UIImage(named: "block.png")!)
        c1Obs.frame = c1loc
        self.view.addSubview(c1Obs)
        
        let b3Obs = UIImageView(image: UIImage(named: "block.png")!)
        b3Obs.frame = b3loc
        self.view.addSubview(b3Obs)
        
        
        //treasure
        let treasure = UIImageView(image: UIImage(named: "treasure.png")!)
        treasure.frame = c3loc
        self.view.addSubview(treasure)
        
        //failed
        self.view.addSubview(failedView!)
        self.view.bringSubviewToFront(failedView!)
    }
    
    func addActionImage() {
        
       
    }
    
    //MARK: -created movement
    
    func move (direction: String)  {

        var result: CGRect?
        switch direction {
            
        case "forward":
          
            if robot?.image == UIImage(named: "depan.png") {
                self.robot?.transform = (self.robot?.transform.translatedBy(x: 0, y: 142.5))!
                
            }else if self.robot?.image == UIImage(named: "kiri.png") {
                self.robot?.transform = (self.robot?.transform.translatedBy(x: 142.5, y: 0))!
                
            }else if self.robot?.image == UIImage(named: "kanan.png") {
                UIView.animate(
                    withDuration: 2, delay: 0, usingSpringWithDamping: 1.9, initialSpringVelocity: 3.0, options: [], animations: {
                        self.robot?.transform = (self.robot?.transform.translatedBy(x: -142.5, y: 0))!
                        
                    })
            }

            
        case "left":
            if robot?.image == UIImage(named: "depan.png"){
                self.robot?.image = UIImage(named: "kiri.png")
            }else if robot?.image == UIImage(named: "kanan.png"){
                self.robot?.image = UIImage(named: "depan.png")
            }
            
        case "right":
            if robot?.image == UIImage(named: "depan.png"){
                self.robot?.image = UIImage(named: "kanan.png")
            }else if robot?.image == UIImage(named: "kiri.png"){
                self.robot?.image = UIImage(named: "depan.png")
            }

            
        case "restart":
            self.robot?.image = UIImage(named: "depan.png")
            self.robot?.frame = a1loc
            
        case "kosong":
            result = robot?.frame

            
        default:
            print("no move")
        }
    }
    
    func delay(_ delay:Double, closure:@escaping () -> ()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    
    // MARK: -run move
//    func runMove() {
//        UIView.animate(withDuration: 1, delay: 0) {
//            self.move(direction: "\(self.action[0])")
//        } completion: { isTrue in
//            UIView.animate(withDuration: 1, delay: 0) {
//                if self.action.count >= 2 {
//                    self.move(direction: "\(self.action[1])")
//                }else {
//                    self.move(direction: "\(self.action[0])")
//                }
//
//            } completion: { isTrue2 in
//                UIView.animate(withDuration: 1, delay: 0) {
//                    if self.action.count >= 3 {
//                        self.move(direction: "\(self.action[2])")
//                    }else {
//                        self.move(direction: "\(self.action[0])")
//                    }
//
//                } completion: { isTrue3 in
//                    UIView.animate(withDuration: 1, delay: 0) {
//                        if self.action.count >= 4 {
//                            self.move(direction: "\(self.action[3])")
//                        }else {
//                            self.move(direction: "\(self.action[0])")
//                        }
//
//                    } completion: { isTrue4 in
//                        UIView.animate(withDuration: 1, delay: 0) {
//                            if self.action.count >= 5 {
//                                self.move(direction: "\(self.action[4])")
//                            }else {
//                                self.move(direction: "\(self.action[0])")
//                            }
//                        } completion: { isTrue5 in
//                            UIView.animate(withDuration: 1, delay: 0) {
//                                if self.action.count >= 6 {
//                                    self.move(direction: "\(self.action[5])")
//                                }else {
//                                    self.move(direction: "\(self.action[0])")
//                                }
//                            } completion: { isTrue6 in
//                                UIView.animate(withDuration: 1, delay: 0) {
//                                    if self.action.count >= 7 {
//                                        self.move(direction: "\(self.action[6])")
//                                    }else {
//                                        self.move(direction: "\(self.action[0])")
//                                    }
//                                } completion: { isTrue7 in
//                                    UIView.animate(withDuration: 1, delay: 0) {
//                                        if self.action.count >= 8 {
//                                            self.move(direction: "\(self.action[7])")
//                                        }else {
//                                            self.move(direction: "\(self.action[0])")
//                                        }
//                                    } completion: { isTrue8 in
//                                        UIView.animate(withDuration: 1, delay: 0) {
//                                            if self.action.count >= 9 {
//                                                self.move(direction: "\(self.action[8])")
//                                            }else {
//                                                self.move(direction: "\(self.action[0])")
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
    
// MARK: -Created button
    
    @IBAction func forwardAction(_ sender: Any) {
        actionRobot.append("forward")
        actionBox.append("Move Forward")
        
        tableView.reloadData()
        
        offButton()
        
        
    }
    @IBAction func leftAction(_ sender: Any) {
        actionRobot.append("left")
        actionBox.append("Turn Left")
        
        tableView.reloadData()
        
        offButton()
        

    }
    @IBAction func rightAction(_ sender: Any) {
        actionRobot.append("right")
        actionBox.append("Turn Right")
        
        tableView.reloadData()
        
        offButton()
        

    }
    @IBAction func trashAction(_ sender: Any) {
        robot?.image = UIImage(named: "depan.png")
        actionRobot.removeAll()
        actionRobot.append("kosong")
        actionBox.removeAll()
        actionBox.append("")
        
        tableView.reloadData()
        robot?.frame = a1loc
        
        onButton()
    }
    @IBAction func runAction(_ sender: Any) {
        
        runButton.isEnabled = false
        offButton()        
        
        UIView.animate(withDuration: 1, delay: 0) {
            if self.actionRobot.count >= 2 {
                self.move(direction: "\(self.actionRobot[1])")
            }else {
                self.move(direction: "\(self.actionRobot[0])")
            }
        } completion: { isTrue in
            UIView.animate(withDuration: 1, delay: 0) {
                if self.actionRobot.count >= 3 {
                    self.move(direction: "\(self.actionRobot[2])")
                }else {
                    self.move(direction: "\(self.actionRobot[0])")
                }
            } completion: { isTrue2 in
                UIView.animate(withDuration: 1, delay: 0) {
                    self.finishPoint()
                } completion: { isTrue3 in
                    UIView.animate(withDuration: 1, delay: 0) {
                        if self.actionRobot.count >= 4 {
                            self.move(direction: "\(self.actionRobot[3])")
                        }else {
                            self.move(direction: "\(self.actionRobot[0])")
                        }
                    } completion: { isTrue4 in
                        UIView.animate(withDuration: 1, delay: 0) {
                            self.finishPoint()
                        } completion: { isTrue5 in
                            UIView.animate(withDuration: 1, delay: 0) {
                                if self.actionRobot.count >= 5 {
                                    self.move(direction: "\(self.actionRobot[4])")
                                }else {
                                    self.move(direction: "\(self.actionRobot[0])")
                                }
                            } completion: { isTrue6 in
                                UIView.animate(withDuration: 1, delay: 0) {
                                    self.finishPoint()
                                } completion: { isTrue7 in
                                    UIView.animate(withDuration: 1, delay: 0) {
                                        if self.actionRobot.count >= 6 {
                                            self.move(direction: "\(self.actionRobot[5])")
                                        }else {
                                            self.move(direction: "\(self.actionRobot[0])")
                                        }
                                    } completion: { isTrue8 in
                                        UIView.animate(withDuration: 1, delay: 0) {
                                            self.finishPoint()
                                        } completion: { isTrue9 in
                                            UIView.animate(withDuration: 1, delay: 0) {
                                                if self.actionRobot.count >= 7 {
                                                    self.move(direction: "\(self.actionRobot[6])")
                                                }else {
                                                    self.move(direction: "\(self.actionRobot[0])")
                                                }
                                            } completion: { isTrue10 in
                                                UIView.animate(withDuration: 1, delay: 0) {
                                                    self.finishPoint()
                                                } completion: { isTrue11 in
                                                    UIView.animate(withDuration: 1, delay: 0) {
                                                        if self.actionRobot.count >= 8 {
                                                            self.move(direction: "\(self.actionRobot[7])")
                                                        }else {
                                                            self.move(direction: "\(self.actionRobot[0])")
                                                        }
                                                    } completion: { isTrue12 in
                                                        UIView.animate(withDuration: 1, delay: 0) {
                                                            self.finishPoint()
                                                        } completion: { isTrue13 in
                                                            UIView.animate(withDuration: 1, delay: 0) {
                                                                if self.actionRobot.count >= 9 {
                                                                    self.move(direction: "\(self.actionRobot[8])")
                                                                }else {
                                                                    self.move(direction: "\(self.actionRobot[0])")
                                                                }
                                                            } completion: { isTrue14 in
                                                                UIView.animate(withDuration: 1, delay: 0) {
                                                                    self.finishPoint()
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

        
    }
    @IBAction func homeAction(_ sender: Any) {
        routeToMain()
    }
    
    @IBAction func ulangiAction(_ sender: Any) {
        robot?.image = UIImage(named: "depan.png")
        actionRobot.removeAll()
        actionRobot.append("kosong")
        actionBox.removeAll()
        actionBox.append("")
        
        tableView.reloadData()
        robot?.frame = a1loc
        
        onButton()
        
        failedView.isHidden = true
    }
    
    
    //MARK: -checkpoint
    
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
    
    
    func finishPoint() {
        let robotPosition = robot?.frame
        
        if robotPosition == a1loc {
            print("robot in a1")
        }else if robotPosition == a2loc{
            
            delay(1) {
                self.failedView.isHidden = false
             }
            print("robot in a2")
        }else if robotPosition == a3loc{
            print("robot in a3")
        }else if robotPosition == b1loc{
            print("robot in b1")
        }else if robotPosition == b2loc{
            print("robot in b2")
        }else if robotPosition == b3loc{
            delay(1) {
                self.failedView.isHidden = false
             }
            print("robot in b3")
        }else if robotPosition == c1loc{
            delay(1) {
                self.failedView.isHidden = false
             }
            print("robot in c1")
        }else if robotPosition == c2loc{
            print("robot in c2")
        }else if robotPosition == c3loc{
            routeToSucces()
            print("robot in c3")
        }else {
            delay(1) {
                self.failedView.isHidden = false
             }
        }
    }
    
    // MARK: - NAVIGATION
    
    
    
    func routeToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.modalPresentationStyle = .fullScreen
        self.present(ViewController, animated: false, completion: nil)
    }
    
    func routeToSucces() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let succedVC = success2DTiga()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = succedVC
        }, completion: nil)
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
