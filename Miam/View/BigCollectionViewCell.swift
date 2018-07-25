//
//  BigCollectionViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class BigCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var store: Store? {
        didSet {
            title.text = store?.name
            if let dist = store?.distance {
                distance.text = String(format: "%.2f", dist / 1000.0) + "km"
            } else {
                distance.text = "--"
            }
            backgroundImageView.loadImage(fromUrl: store?.imageUrl)
        }
    }

}
