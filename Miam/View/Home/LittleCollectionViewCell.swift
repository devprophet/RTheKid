//
//  LittleCollectionViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class LittleCollectionViewCell: UICollectionViewCell, CanBind {
    
    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        }
    }
    
    var categorie: Categorie? {
        didSet {
            title.text = categorie?.name
            imageView.loadImage(fromUrl: categorie?.imageUrl)
        }
    }
    
    func bind(with data: Any?) {
        guard let data = data as? Categorie else { return }
        categorie = data
    }
    
}
