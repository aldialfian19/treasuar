//
//  arSuccessSatu.swift
//  treasuar
//
//  Created by suryadi - on 01/12/22.
//

import UIKit

class success2DEmpat: UIViewController {

    @IBOutlet var successLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.font = UIFont(name: "Boldhead", size: 32)
        successLabel.textColor = .white

        // Do any additional setup after loading the view.
    }
    func nextModeLima() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let LevelLimaVC = LevelLimaVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = LevelLimaVC
        }, completion: nil)
    }

    func mainMenuModeEmpat() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.modalPresentationStyle = .fullScreen
        self.present(ViewController, animated: false, completion: nil)
    }

    
    @IBAction func naikLevelDua(_ sender: Any) {
        nextModeLima()
    }
    
    
    @IBAction func mainMenusatu(_ sender: Any) {
        mainMenuModeEmpat()
    }
    
}
