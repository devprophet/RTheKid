//
//  StoreNavigationItem.swift
//  Miam
//
//  Created by Alexis Gougaut on 28/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class OrderNavigationItem: UINavigationItem {
    
    var controller: UIViewController?
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        print("back")
        controller?.dismiss(animated: true, completion: nil)
    }
}
