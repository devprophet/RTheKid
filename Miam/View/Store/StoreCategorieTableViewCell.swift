//
//  StoreCategorieTableViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 26/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class StoreCategorieTableViewCell: UITableViewCell {

    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
