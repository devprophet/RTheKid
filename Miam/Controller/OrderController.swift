//
//  OrderController.swift
//  Miam
//
//  Created by Alexis Gougaut on 28/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class OrderController: UITableViewController {

    var customisables: [Customisables]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationItem as? OrderNavigationItem)?.controller = self.navigationController
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return customisables?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (customisables?[section].customisables?.count) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return customisables?[section].title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell
        cell.bind(with: customisables?[indexPath.section].customisables?[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customisables?[indexPath.section].select(customisable: (customisables?[indexPath.section].customisables?[indexPath.row])!)
        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
    }

}
