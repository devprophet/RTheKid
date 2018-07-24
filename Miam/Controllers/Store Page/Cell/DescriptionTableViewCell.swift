//
//  DescriptionTableViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 17/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var StoreImage: UIImageView!
    @IBOutlet weak var StoreTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //StoreImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        // Pour que l'image ait aussi les bords arrondis
        StoreImage.layer.masksToBounds = true
        StoreImage.layer.cornerRadius = 10
        
        // Le corner radius de la zone du blur
        let effect = viewWithTag(22)!
        effect.layer.cornerRadius = 10
        //effect?.clipsToBounds = true
        
        StoreTitle.text = StoreTitle.text?.uppercased()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
