//
//  AllSportsCollectionViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 18/05/2023.
//

import UIKit

class AllSportsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var sportImg: UIImageView!
    @IBOutlet weak var sportTitle: UILabel!
    
    func setCell(name : String , photo : UIImage){
        
        sportImg.image = photo
        sportTitle.text = name
    }
}
