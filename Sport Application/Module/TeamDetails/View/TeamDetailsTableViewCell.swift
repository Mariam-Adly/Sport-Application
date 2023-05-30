//
//  TeamDetailsTableViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import UIKit

class TeamDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
