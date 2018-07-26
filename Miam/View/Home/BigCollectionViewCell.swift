//
//  BigCollectionViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class BigCollectionViewCell: UICollectionViewCell, CanBind {

    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var distance: UILabel!
    @IBOutlet weak private var backgroundImageView: UIImageView!
    @IBOutlet weak private var darkerView: UIView!
    
    var store: Store? {
        didSet {
            title.text = store?.name
            if let dist = store?.distance {
                distance.text = String(format: "%.2f", dist / 1000.0) + "km"
            } else {
                distance.text = "--"
            }
            backgroundImageView.backgroundColor = UIColor.gray
            backgroundImageView.layer.cornerRadius = 10
            backgroundImageView.clipsToBounds = true
            backgroundImageView.loadImage(fromUrl: store?.imageUrl)
            
            darkerView.layer.cornerRadius = 10
            
        }
    }
    
    func bind(with data: Any?) {
        guard let data = data as? Store else { return }
        store = data
    }

}
