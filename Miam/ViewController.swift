//
//  ViewController.swift
//  Miam
//
//  Created by Alexis Gougaut on 13/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

struct DataView {
    
    var title       : String
    var cellHeight  : Float
    var indexPath   : IndexPath
    
    init(title: String, cellHeight: Float, indexPath: IndexPath) {
        self.title      = title
        self.cellHeight = cellHeight
        self.indexPath  = indexPath
    }
    
}

extension UIView: Badgeable {}

class ViewController: UITableViewController, ControllerProtocols {

    @IBOutlet weak var Item: HomeUIBarButtonItem!
    
    let dataViews = [
        DataView(title: "Snacks à proximitée", cellHeight: 259, indexPath: IndexPath(row: 1, section: 0)),
        DataView(title: "Restaurants à proximitée", cellHeight: 259, indexPath: IndexPath(row: 2, section: 0))
    ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Item.badgeCount = 8
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + dataViews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "inline", for: indexPath) as! CellInlineController
            cell.delegate = self
            return cell
        } else {
            let data = dataViews.first(where: { x in x.indexPath == indexPath })
            let cell = tableView.dequeueReusableCell(withIdentifier: "inlineBig", for: indexPath) as! InlineBigTableViewCell
            cell.delegate = self
            cell.title.text = data?.title
            
            return cell
        }
    }
    
    func CanSegue(with: String?) {
        guard let with = with else { return }
        performSegue(withIdentifier: with, sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        } else {
            if let data = dataViews.first(where: { (x) in x.indexPath == indexPath }) {
                return CGFloat(data.cellHeight)
            } else {
                return 0
            }
        }
    }
    
}

