//
//  Sport.swift
//  Sport Application
//
//  Created by mariam adly on 18/05/2023.
//

import Foundation
import UIKit

class Sport{
    var sportName : String
    var sportImg : UIImage
    init(sportName: String, sportImg: UIImage) {
        self.sportName = sportName
        self.sportImg = sportImg
    }
}

class LeagueItem{
    var leagueName : String
    var leagueImg : UIImage
    init(leagueName: String, leagueImg: UIImage) {
        self.leagueName = leagueName
        self.leagueImg = leagueImg
    }
}
