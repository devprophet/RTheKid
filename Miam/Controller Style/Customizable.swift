//
//  Customizable.swift
//  Miam
//
//  Created by Alexis Gougaut on 16/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import Foundation

struct CustomizableItem {
    
    var Name: String
    var State: Bool
    
    init(Name: String, State: Bool) {
        self.Name = Name
        self.State = State
    }
    
}

struct Customizable {
    
    var Title: String
    var AllSelectedByDefault: Bool
    var MultipleSelection: Bool
    var MaxSelections: Int
    var Items: [CustomizableItem]
    
    init(Title: String, AllSelectedByDefault: Bool, Items: [CustomizableItem], MultipleSelection: Bool = false, MaxSelections: Int = 0) {
        self.Title = Title
        self.AllSelectedByDefault = AllSelectedByDefault
        self.Items = Items
        self.MultipleSelection = MultipleSelection
        self.MaxSelections = MaxSelections
    }
    
    func CanSelected() -> Bool {
        
        if Items.filter( { x in x.State == true } ).count < MaxSelections {
            return true
        } else {
            return false
        }
    }
    
    mutating func Select(Item: CustomizableItem) {
        
        if let index = Items.firstIndex(where: { x in x.Name == Item.Name }) {
            if MultipleSelection {
                if !Items[index].State {
                    if CanSelected() {
                        self.Items[index].State = !Items[index].State
                    }
                } else {
                    self.Items[index].State = !Items[index].State
                }
            } else {
                self.Items.forEach { x in
                    if let _index = self.Items.firstIndex(where: { y in y.Name == x.Name } ) {
                        if _index != index {
                            self.Items[_index].State = false
                        } else {
                            self.Items[_index].State = !self.Items[_index].State
                        }
                    }
                }
            }
        }
    }
    
}
