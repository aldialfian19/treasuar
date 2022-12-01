//
//  arSuccessSatu.swift
//  treasuar
//
//  Created by suryadi - on 01/12/22.
//

import UIKit

class arSuccessEmpat: UIViewController {

    @IBOutlet var successLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.font = UIFont(name: "Boldhead", size: 32)
        successLabel.textColor = .white

        // Do any additional setup after loading the view.
    }
    func nextLevelLima() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let LevelFiveVC = LevelFiveVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = LevelFiveVC
        }, completion: nil)
    }

    func mainMenuAREmpat() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.modalPresentationStyle = .fullScreen
        self.present(ViewController, animated: false, completion: nil)
    }

    
    @IBAction func naikLevelDua(_ sender: Any) {
        nextLevelLima()
    }
    
    
    @IBAction func mainMenusatu(_ sender: Any) {
        mainMenuAREmpat()
    }
    
}
