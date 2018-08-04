//
//  CartTableViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 29/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak private var title: UILabel! {
        didSet {
            //title.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lobortis magna vitae justo tempus feugiat. Curabitur consequat nulla nunc, eleifend maximus nisi suscipit non. Quisque vulputate justo dolor, quis imperdiet ante egestas a. Fusce ut erat eget nisi bibendum convallis. Morbi ac ex eget lorem hendrerit vehicula sed sed sem. Fusce quis magna dapibus, pulvinar urna quis, sodales sem. Donec vel tristique justo. Suspendisse faucibus erat lobortis risus maximus cursus. Mauris vestibulum massa vitae odio commodo suscipit. Praesent et dictum orci. Nullam imperdiet rutrum nibh, nec sagittis tortor efficitur et. Nunc venenatis consequat lobortis. Phasellus in mattis erat. Morbi placerat odio metus, sit amet pretium odio dapibus id."
            title.text = """
            x1 Américain Poulet
            Sauces : Samourai, Mayonnaise, Brésil
            Autres : Sans jambon.
            
            Montant à régler : 3€
            Methode de règlement : Liquide
            """
        }
    }
    
    @IBOutlet weak var badgeLabel: UILabel! {
        didSet {
            badgeLabel.textColor = UIColor.white
            badgeLabel.text = "En cours"
        }
    }
    
    @IBOutlet weak private var badge: UIView! {
        didSet {
            
            //badge.layer.cornerRadius = badge.frame.height / 2
            // badge.backgroundColor = UIColor.black.withAlphaComponent(0.1)
            //badge.backgroundColor = UIColor(r: 251, g: 197, b: 49, a: 255)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        badgeLabel.backgroundColor = UIColor(r: 251, g: 197, b: 49, a: 255)
        badgeLabel.layer.cornerRadius = badgeLabel.frame.height / 2
        badgeLabel.layer.masksToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
