//
//  HomeVCViewController.swift
//  treasuar
//
//  Created by Zakki Mudhoffar on 23/11/22.
//

import UIKit

class HomeVCViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addImage() {
        let imageName = "bg"
        let image = UIImage(named: imageName)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
