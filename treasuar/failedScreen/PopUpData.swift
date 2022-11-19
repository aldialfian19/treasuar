//
//  FailedData.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 20/11/22.
//

import Foundation
import UIKit

class PopUpData {
    static let shared: PopUpData = PopUpData()
    func fetchData() -> [PopUpModel]{
        var arrPopUp = [PopUpModel]()
        
        let PopUpOne = PopUpModel(id: 1, image: "failedSatu", desc: "wahh robot ...")
        arrPopUp.append(PopUpOne)
        let PopUpTwo = PopUpModel(id: 2, image: "failedDua", desc: "wahh robot..")
        arrPopUp.append(PopUpTwo)
        
        return arrPopUp
    }
}
