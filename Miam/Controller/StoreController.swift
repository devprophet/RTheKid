//
//  StoreController.swift
//  Miam
//
//  Created by Alexis Gougaut on 26/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class StoreController: UITableViewController {
    
    // Le magasin
    var store: Store?
    
    // Les categories de produits que vend le magasin
    var categories : [Categorie]?
    
    var navItem: StoreNavigationItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem = self.navigationItem as? StoreNavigationItem
        navItem?.rootController = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = store?.type
        
        // A chaque fois que la view apparait, on recharge la tableView
        tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Le nombre de row dans le tableau est égale aux nombres de catégories que possèdes le magasin + une row pour
        // afficher les infos du magasin
        if(categories != nil && store != nil) { return categories!.count + 1 } else { return 0 }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // La row pour afficher les informations du magasin et la première
        if(indexPath.row == 0) {
            let storeInfosCell = tableView.dequeueReusableCell(withIdentifier: "storeInfos", for: indexPath) as! StoreInfosTableViewCell
            storeInfosCell.bind(with: store)
            return storeInfosCell
        } else {
            let storeCategorieCell = tableView.dequeueReusableCell(withIdentifier: "storeCategorie", for: indexPath) as! StoreCategorieTableViewCell
            storeCategorieCell.bind(with: categories?[indexPath.row - 1])
            return storeCategorieCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row > 0) {
            performSegue(withIdentifier: "storeOrder", sender: store?.productSell?.first(where: { x in x.categorie == categories?[indexPath.row - 1] }))
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 300
        } else {
            return 44
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "storeOrder") {
            if let destination = segue.destination as? UINavigationController {
                if let controller = destination.viewControllers.first as? OrderController {
                    controller.product = (sender as? Product) ?? nil
                }
            }
        }
    }
 

}
