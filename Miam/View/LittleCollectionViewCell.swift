//
//  LittleCollectionViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class LittleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height
        }
    }
    
    var categorie: Categorie? {
        didSet {
            title.text = categorie?.name
            imageView.loadImage(fromUrl: categorie?.imageUrl)
        }
    }
    
}
