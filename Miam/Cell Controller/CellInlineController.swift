//
//  CellInlineController.swift
//  Miam
//
//  Created by Alexis Gougaut on 13/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class CellInlineController: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    weak var delegate: ControllerProtocols?
    
    override func awakeFromNib() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    var Data: InlineData?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data != nil ? Data!.data.count : 45
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.viewWithTag(1)?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        cell.viewWithTag(1)?.layer.cornerRadius = (cell.viewWithTag(1)?.frame.height)! / 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.CanSegue(with: "Customization")
    }
    
}
