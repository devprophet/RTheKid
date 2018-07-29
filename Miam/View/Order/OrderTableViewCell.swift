//
//  OrderTableViewCell.swift
//  Miam
//
//  Created by Alexis Gougaut on 28/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell, CanBind {

    @IBOutlet weak var title: UILabel!
    
    var data: Customisable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func bind(with data: Any?) {
        guard let data = data as? Customisable else { return }
        title.text = data.name
        setState(state: data.state)
        self.data = data
    }
    
    /// Definie le status de la cellule
    func setState(state: Bool?) {
        guard let state = state else {
            self.accessoryType = .none
            return
        }
        
        if(state) {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }
    }

}
