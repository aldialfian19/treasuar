//
//  failedVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 27/11/22.
//

import UIKit

class failedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ulangiAction(_ sender: Any) {
    }
    @IBAction func mainAction(_ sender: Any) {
        routeToMain()
    }
    
    func routeToMain() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let mainVC = mainVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = mainVC
        }, completion: nil)
    }

}
