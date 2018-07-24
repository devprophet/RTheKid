//
//  StorePageTableViewController.swift
//  Miam
//
//  Created by Alexis Gougaut on 17/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class StorePageTableViewController: UITableViewController {
    
    let showSeparator = false

    @IBAction func Close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 8
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DescriptionTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategorie", for: indexPath) //as! DescriptionTableViewCell
            //cell.StoreImage.layer.cornerRadius = 10
            
            if indexPath.row > 0 && indexPath.row < 9 && showSeparator {
                // Create te separator
                let separator = UIView(frame: CGRect(x: 40, y: 0, width: tableView.frame.width - 80, height: 1))
                separator.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
                cell.addSubview(separator)
            }
            
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 225
            } else {
                return 200
            }
        } else {
            return 44
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section > 0 {
            return 80
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section > 0 {
            let view = UIView(frame: CGRect(x: 20, y: 30, width: tableView.frame.width - 20, height: 40))
            view.backgroundColor = UIColor.white
            let label = UILabel(frame: view.frame)
            label.tag = 1
            label.text = "Catégories"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            view.addSubview(label)
            return view
        } else {
            return nil
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
