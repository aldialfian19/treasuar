//
//  arSuccessSatu.swift
//  treasuar
//
//  Created by suryadi - on 01/12/22.
//

import UIKit

class success2DDua: UIViewController {

    @IBOutlet var successLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.font = UIFont(name: "Boldhead", size: 32)
        successLabel.textColor = .white

        // Do any additional setup after loading the view.
    }
    func nextModeTiga() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let LevelTigaVC = LevelTigaVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = LevelTigaVC
        }, completion: nil)
    }

    func mainMenuModedua() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.modalPresentationStyle = .fullScreen
        self.present(ViewController, animated: false, completion: nil)
    }

    
    @IBAction func naikLevelDua(_ sender: Any) {
        nextModeTiga()
    }
    
    
    @IBAction func mainMenusatu(_ sender: Any) {
        mainMenuModedua()
    }
    
}
