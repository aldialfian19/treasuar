//
//  ARVC.swift
//  treasuar
//
//  Created by suryadi - on 29/11/22.
//

import Foundation
import UIKit

class ARVC : UIViewController{
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var buttonSatu: UIButton!
    @IBOutlet var buttonDua: UIButton!
    @IBOutlet var buttonTiga: UIButton!
    @IBOutlet var buttonEmpat: UIButton!
    @IBOutlet var buttonLima: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                nameLabel.text = "Hi, Steve!"
//                nameLabel.textAlignment = .left
//                nameLabel.font = UIFont(name: "Boldhead", size: 64)
    }
    
    func routeToLevelOne() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelOneVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }
    
    func routeToLevelTwo() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelTwoVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }
    
    func routeToLevelThree() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelThreeVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }
    
    @IBAction func oneAction(_ sender: Any) {
        routeToLevelOne()
    }
    
    @IBAction func twoAction(_ sender: Any) {
        routeToLevelTwo()
    }
    @IBAction func threeAction(_ sender: Any) {
        routeToLevelThree()
    }
    
    
}
