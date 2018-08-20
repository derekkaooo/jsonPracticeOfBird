//
//  birdTableViewCell.swift
//  jsonPracticeOfBird
//
//  Created by Derek on 2018/8/15.
//  Copyright © 2018年 Derek. All rights reserved.
//

import UIKit

class birdTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
