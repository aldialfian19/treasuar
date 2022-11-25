//
//  ViewController.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonSatu: UIButton!
    @IBOutlet var buttonDua: UIButton!
    @IBOutlet var buttonTiga: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func routeToLevelOne() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelSatuVC = LevelSatuVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelSatuVC
        }, completion: nil)
    }
    
    func routeToLevelTwo() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelDuaVC = LevelDuaVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelDuaVC
        }, completion: nil)
    }
    
    func routeToLevelThree() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelTigaVC = LevelTigaVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelTigaVC
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

