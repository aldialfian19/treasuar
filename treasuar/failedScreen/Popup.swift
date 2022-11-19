//
//  Popup.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 20/11/22.
//

import UIKit

class Popup: UIViewController {
    @IBOutlet var popupDetail: UILabel!
    @IBOutlet var popupButton: UIButton!
    @IBOutlet var popupImage: UIImageView!
    
    var data = PopUpData.shared.fetchData()
    var id = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(index: id)

    }
    func updateUI(index: Int){
        popupDetail.text = data[index].desc
        popupImage.image = UIImage(named: data[index].image)
    }

}
