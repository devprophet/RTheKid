//
//  BigCollectionCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class BigTableViewCell: UITableViewCell, CanBind {

    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// Assigne le `Delegate` et le `DataSource` de la `UICollectionView` qui et dans cette cellule
    func setCollectionViewDataSourceDelegate<T: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: T, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    
    func bind(with data: Any?) {
        guard let data = data as? String else { return }
        title.text = data
    }
    
}
