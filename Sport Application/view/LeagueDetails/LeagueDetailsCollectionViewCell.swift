//
//  LeagueDetailsCollectionViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import Foundation
import UIKit

class LeagueDetailsCollecViewCell: UICollectionViewCell {

    @IBOutlet weak var awatTeamName: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    
    @IBOutlet weak var VSLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


  
}
