//
//  InlineBigTableViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 14/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class InlineBigTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var delegate: ControllerProtocols?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // TODO: dwdwdwd
    // A modifier plus tard...
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Stylize
        cell.viewWithTag(1)?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        cell.viewWithTag(1)?.layer.cornerRadius = 10
        
        let label = (cell.viewWithTag(3) as? UILabel)
        label?.numberOfLines = 0
        label?.sizeToFit()
        
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var visibleRect    = CGRect()
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size   = collectionView.bounds.size
        let visiblePoint   = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        if let cellVisible = collectionView.indexPathForItem(at: visiblePoint) {
            if cellVisible.row == 9 {
                return
            }
            if let c = collectionView.cellForItem(at: cellVisible) {
                let point = CGPoint(x: c.frame.origin.x - 20, y: 0)
                scrollView.setContentOffset(point, animated: true)
                //collectionView.scrollToItem(at: cellVisible, at: .left, animated: true)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndDragging(scrollView, willDecelerate: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.CanSegue(with: "StorePage")
    }

}
