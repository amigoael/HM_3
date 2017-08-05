//
//  CarCell.swift
//  practice_3
//
//  Created by Anton Lebedev on 16.07.17.
//  Copyright © 2017 Anton Lebedev. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
