//
//  AboutMeCell.swift
//  iAmAR
//
//  Created by ScaRiLiX on 8/31/18.
//  Copyright © 2018 ScaRiLiX. All rights reserved.
//

import UIKit

class AboutMeCell: UITableViewCell {

    @IBOutlet weak var infoKeyLabel: UILabel!
    @IBOutlet weak var infoValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCellSection(key: String, value: String)
    {
        infoKeyLabel.text = key
        infoValueLabel.text = value
    }
}
