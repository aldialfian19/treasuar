//
//  arSuccessSatu.swift
//  treasuar
//
//  Created by suryadi - on 01/12/22.
//

import UIKit

class arSuccessLima: UIViewController {

    @IBOutlet var successLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.font = UIFont(name: "Boldhead", size: 32)
        successLabel.textColor = .white

        // Do any additional setup after loading the view.
    }
    

    func mainMenuARLima() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.modalPresentationStyle = .fullScreen
        self.present(ViewController, animated: false, completion: nil)
    }

    

    
    
    @IBAction func mainMenusatu(_ sender: Any) {
        mainMenuARLima()
    }
    
}
