//
//  StoreInfosTableViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 26/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class StoreInfosTableViewCell: UITableViewCell, CanBind {

    @IBOutlet weak private var name: UILabel! {
        didSet {
            name.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        }
    }
    @IBOutlet weak private var address: UILabel! {
        didSet {
            address.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        }
    }
    @IBOutlet weak private var backgroundImage: UIImageView! {
        didSet {
            backgroundImage.layer.cornerRadius = 10
            backgroundImage.clipsToBounds = true
            backgroundImage.backgroundColor = UIColor.black.withAlphaComponent(0.1)
            backgroundImage.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak private var darkerView: UIView! {
        didSet {
            darkerView.layer.cornerRadius = 10
            darkerView.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with data: Any?) {
        guard let data = data as? Store else { return }
        name.text = data.name?.uppercased()
        address.text = data.address
        backgroundImage.loadImage(fromUrl: data.imageUrl)
    }

}
