//
//  CustomizationTableViewController.swift
//  Miam
//
//  Created by Alexis Gougaut on 16/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class CustomizationTableViewController: UITableViewController {

    var customizable = [Customizable]()
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizable.append(
            Customizable(Title: "Choisis ta base", AllSelectedByDefault: false, Items: [
                CustomizableItem(Name: "Poulet",       State: false),
                CustomizableItem(Name: "Sarcive",    State: false),
                CustomizableItem(Name: "Steak",      State: false),
                CustomizableItem(Name: "Jambon",        State: false)
            ], MultipleSelection: false, MaxSelections: 0)
        )
        
        customizable.append(
            Customizable(Title: "Choisis tes sauces", AllSelectedByDefault: false, Items: [
                CustomizableItem(Name: "Ketchup",       State: false),
                CustomizableItem(Name: "Mayonnaise",    State: false),
                CustomizableItem(Name: "Samourai",      State: false),
                CustomizableItem(Name: "Brésil",        State: false)
                ], MultipleSelection: true, MaxSelections: 3)
        )
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return customizable.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customizable[section].Items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = customizable[indexPath.section].Items[indexPath.row]

        let label = cell.viewWithTag(1) as? UILabel
        label?.text = item.Name
        
        if item.State {
            label?.textColor = .orange
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
            label?.textColor = .lightGray
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        customizable[indexPath.section].Select(Item: customizable[indexPath.section].Items[indexPath.row])
        
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
        tableView.endUpdates()
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return customizable[section].Title
    }

}
