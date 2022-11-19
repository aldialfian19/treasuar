//
//  FailedVC.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit

class FailedVC: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var text: UILabel!
    @IBOutlet var backButton: UIButton!
    
    var data = FailedData.shared.fetchData()
    var id = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(index: id)

    }
    func updateUI(index: Int){
        text.text = data[index].desc
        image.image = UIImage(named: data[index].image)
    }

}
