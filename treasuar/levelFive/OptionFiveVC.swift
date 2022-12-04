//
//  OptionSatuVC.swift
//  treasuar
//
//  Created by suryadi - on 30/11/22.
//

import UIKit

class OptionFiveVC: UIViewController {

    
    @IBOutlet var optionLabel2D5: UILabel!
    @IBOutlet var optionLabel5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionLabel5.font = UIFont(name: "Boldhead", size: 128)
        optionLabel5.textColor = .white
        optionLabel2D5.font = UIFont(name: "Boldhead", size: 128)
        optionLabel2D5.textColor = .white

        // Do any additional setup after loading the view.
    }
    func toARLima() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelFiveVC = LevelFiveVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelFiveVC
        }, completion: nil)
    }
    
    func toModeLima() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelLimaVC = LevelLimaVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelLimaVC
        }, completion: nil)
    }




    @IBAction func modeFiveAction(_ sender: Any) {
        toModeLima()
    }
    

    @IBAction func arFiveAction(_ sender: Any) {
        toARLima()
        
    }
}
