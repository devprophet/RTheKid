//
//  InlineData.swift
//  Miam
//
//  Created by Alexis Gougaut on 13/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

struct InlineData {
    var title: String
    var data: [Any]
    
    init(from: [String: Any]) {
        if let title = from["Title"] as? String {
            self.title = title
        } else {
            self.title = "No title"
        }
        if let data = from["data"] as? [Any]{
            self.data = data
        } else {
            self.data = []
        }
    }
}
