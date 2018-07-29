//
//  OrderController.swift
//  Miam
//
//  Created by Alexis Gougaut on 28/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class OrderController: UITableViewController {
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationItem as? OrderNavigationItem)?.controller = self.navigationController
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Recharge la tableView a chaque fois que la vue et afficher
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Le nombre de sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return product?.customisables?.count ?? 0
    }
    
    // Le nombre de cellule dans les sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (product?.customisables?[section].customisables?.count) ?? 0
    }
    
    // Le titre des sections
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return product?.customisables?[section].title
    }
    
    // Le model de chaques cellules de chaques sections
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell
        cell.bind(with: product?.customisables?[indexPath.section].customisables?[indexPath.row])
        return cell
    }
    
    // Appeler quand on selectionne une cellule
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customisable = (product?.customisables?[indexPath.section].customisables?[indexPath.row])
        product?.customisables?[indexPath.section].select(customisable: customisable!)
        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
    }

}
