//
//  OnboardingCollectionViewCell.swift
//  Sport Application
//
//  Created by mariam adly on 20/05/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var sliderTitle: UILabel!
    @IBOutlet weak var sliderDescription: UILabel!
    
    func setCell(title : String , description : String, photo : UIImage){
        
        sliderImage.image = photo
        sliderTitle.text = title
        sliderDescription.text = description
    }
}
