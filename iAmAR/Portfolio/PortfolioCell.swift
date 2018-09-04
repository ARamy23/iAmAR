//
//  PortfolioCell.swift
//  iAmAR
//
//  Created by ScaRiLiX on 9/2/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

struct Project
{
    let imageName: UIImage
    let title: String
    let description: String
    
}

class PortfolioCell: UICollectionViewCell {

    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(_ model: Project)
    {
        projectImageView.image = model.imageName
        projectTitleLabel.text = model.title
    }
    
}
