//
//  StoreNavigationItem.swift
//  Miam
//
//  Created by Alexis Gougaut on 27/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class StoreNavigationItem: UINavigationItem {

    var rootController: StoreController?
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        rootController?.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pathTo(_ sender: UIBarButtonItem) {
        
    }
    
}
