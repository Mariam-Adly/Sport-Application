//
//  TeamsCollectionViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 23/05/2023.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 20
        cellView.layer.masksToBounds = true
    }

}
