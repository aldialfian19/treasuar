//
//  OptionSatuVC.swift
//  treasuar
//
//  Created by suryadi - on 30/11/22.
//

import UIKit

class OptionThreeVC: UIViewController {

    
    @IBOutlet var optionLabel3: UILabel!
    @IBOutlet var optionLabel2D3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionLabel3.font = UIFont(name: "Boldhead", size: 128)
        optionLabel3.textColor = .white
        optionLabel2D3.font = UIFont(name: "Boldhead", size: 128)
        optionLabel2D3.textColor = .white

        // Do any additional setup after loading the view.
    }
    func toARTiga() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelThreeVC = LevelThreeVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelThreeVC
        }, completion: nil)
    }
    
    func toModeTiga() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelTigaVC = LevelTigaVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelTigaVC
        }, completion: nil)
    }




    @IBAction func modeOneAction(_ sender: Any) {
        toModeTiga()
    }
    

    @IBAction func arOneAction(_ sender: Any) {
        toARTiga()
        
    }
}
