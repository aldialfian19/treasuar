//
//  OptionSatuVC.swift
//  treasuar
//
//  Created by suryadi - on 30/11/22.
//

import UIKit

class OptionDuaVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func toARDua() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelTwoVC = LevelTwoVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelTwoVC
        }, completion: nil)
    }
    
    func toModeDua() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelDuaVC = LevelDuaVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelDuaVC
        }, completion: nil)
    }




    @IBAction func modeOneAction(_ sender: Any) {
        toModeDua()
    }
    

    @IBAction func arOneAction(_ sender: Any) {
        toARDua()
        
    }
}
