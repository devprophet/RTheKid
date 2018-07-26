//
//  StoreInfosTableViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 26/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class StoreInfosTableViewCell: UITableViewCell {

    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var address: UILabel!
    @IBOutlet weak private var backgroundImage: UIImageView!
    @IBOutlet weak private var darkerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
