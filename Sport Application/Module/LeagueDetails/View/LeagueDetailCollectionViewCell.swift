//
//  LeagueDetailCollectionViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 23/05/2023.
//

import UIKit

class LeagueDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ScoreTeam: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var awatTeamName: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 40
        cellView.layer.masksToBounds = true
        cellView.layer.borderWidth = 2
        cellView.layer.borderColor = UIColor.black.cgColor
    
    }

}
