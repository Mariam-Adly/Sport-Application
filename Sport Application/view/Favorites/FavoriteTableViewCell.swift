//
//  FavoriteTableViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteTeamName: UILabel!
    @IBOutlet weak var favoriteTeamLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
