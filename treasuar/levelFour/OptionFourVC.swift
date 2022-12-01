//
//  OptionSatuVC.swift
//  treasuar
//
//  Created by suryadi - on 30/11/22.
//

import UIKit

class OptionFourVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func toAREmpat() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelFourVC = LevelFourVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelFourVC
        }, completion: nil)
    }
    
    func toModeEmpat() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelFourVC = LevelFourVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelFourVC
        }, completion: nil)
    }




    @IBAction func modeOneAction(_ sender: Any) {
        toModeEmpat()
    }
    

    @IBAction func arOneAction(_ sender: Any) {
        toAREmpat()
        
    }
}
