//
//  OptionSatuVC.swift
//  treasuar
//
//  Created by suryadi - on 30/11/22.
//

import UIKit

class OptionSatuVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func toARSatu() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelOneVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }
    
    func toModeSatu() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelSatuVC = LevelSatuVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelSatuVC
        }, completion: nil)
    }




    @IBAction func modeOneAction(_ sender: Any) {
        toModeSatu()
    }
    

    @IBAction func arOneAction(_ sender: Any) {
        toARSatu()
        
    }
}
