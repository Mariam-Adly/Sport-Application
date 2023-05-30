//
//  LeagueTableViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 19/05/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(name : String , photo : UIImage){
        
        leagueImg.image = photo
        leagueName.text = name
    }

}
