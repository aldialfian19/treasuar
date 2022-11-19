//
//  FailedData.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 20/11/22.
//

import Foundation
import UIKit

class FailedData {
    static let shared: FailedData = FailedData()
    func fetchData() -> [FailedModel]{
        var arrFailed = [FailedModel]()
        
        let failedOne = FailedModel(id: 1, image: "failedSatu", desc: "wahh robot ...")
        arrFailed.append(failedOne)
        let failedTwo = FailedModel(id: 2, image: "failedDua", desc: "wahh robot..")
        arrFailed.append(failedTwo)
        
        return arrFailed
    }
}
