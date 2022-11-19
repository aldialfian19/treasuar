//
//  buttonVc.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit

class buttonVc: UIViewController {

    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    @IBOutlet var trashButton: UIButton!
    @IBOutlet var runButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forwardAction(_ sender: UIButton) {
        print("forward")
    }
    
    @IBAction func leftAction(_ sender: Any) {
        print("left")
    }
    
    @IBAction func rightAction(_ sender: Any) {
        print("right")
    }
    
}
