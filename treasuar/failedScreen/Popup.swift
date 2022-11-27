//
//  Popup.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 20/11/22.
//

import UIKit

class Popup: UIViewController {
    @IBOutlet var popupButton: UIButton!
    @IBOutlet var popupImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func mainButton(_ sender: Any) {
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
