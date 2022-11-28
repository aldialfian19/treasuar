//
//  mainVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 27/11/22.
//

import UIKit

class mainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func satuAction(_ sender: Any) {
        routeToSatu()
    }
    
    @IBAction func duaAction(_ sender: Any) {
        routeToDua()
    }
    
    @IBAction func tigaAction(_ sender: Any) {
        routeToTiga()
    }
    
    func routeToSatu() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let satuVC = LevelSatuVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = satuVC
        }, completion: nil)
    }
    
    func routeToDua() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let duaVC = LevelDuaVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = duaVC
        }, completion: nil)
    }
    
    func routeToTiga() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let tigaVC = LevelTigaVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = tigaVC
        }, completion: nil)
    }
    
}
