//
//  HomeController.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    // Les donnés du serveurs
    var data = ServerData()
    
    // Tous les stores classer par catégories
    var packedStores : [PackedStore]?
    
    // Les différentes catégorie de produits.
    var categories: [Categorie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        tableView.backgroundView = activityIndicator
        
        // Crée une categorie pour notre produit
        let productCategorie = Categorie()
        productCategorie.name = "Américain"
        productCategorie.imageUrl = "https://www.google.fr/"
        
        // Crée des customisables pour notre produit
        let customisables = Customisables()
        customisables.title = "Choisi ta base"
        customisables.customisables = [Customisable]()
        customisables.customisables!.append(contentsOf: [
                Customisable(name: "Poulet"),
                Customisable(name: "Jambon"),
                Customisable(name: "Bouchons"),
                Customisable(name: "Steak")
        ])
        customisables.multipleSelection = false
        customisables.maximumSelection = 0
        
        // Ne pas oublier d'ajouter les customisables de la categorie
        productCategorie.customisables = [customisables]
        
        // Crée un produit
        let product = Product()
        product.categorie = productCategorie
        product.customisables = [Customisables]()
        product.customisables = [customisables]
        product.name = "Américain"
        product.price = 3.00
        
        // Crée un utilisateur
        let user = User()
        user.name = "Alexis"
        user.surname = "Gougaut"
        user.phone = "+330680145402"
        user.verified = true
        
        // Crée un magasin
        let store = Store()
        store.name = "Le parcour du gourmet"
        store.address = "6 venelle Sainte-Anne, 14000 Caen"
        store.imageUrl = "https://www.google.fr/"
        store.owners = [Owner]()
        store.owners!.append(Owner())
        store.owners![0].user = user
        store.owners![0].level = -1
        store.distance = 1542
        store.productSell = [product]
        store.type = "Snack"
        
        // Crée un data
        data.users = [User]()
        data.users?.append(user)
        
        data.stores = [store]
        
        // Le process normale
        packedStores = data.GetPackedStores()
        categories = data.GetCategories(with: packedStores)
        
        activityIndicator.stopAnimating()
        
    }
    
    /// Le nombre de sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // data.stores.
        return 1 + (packedStores?.count ?? 0)
    }
    
    /// Le nombre de row dans la section passez en parametre
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return 1
        } else {
            return (packedStores?[section - 1].stores?.count) ?? 0
        }
    }
    
    /// La cellule coresspondant à la row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "little", for: indexPath) as! LittleTableViewCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "big", for: indexPath) as! BigTableViewCell
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
            cell.bind(with: packedStores?[indexPath.section - 1].title)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return 130
        } else {
            return 290
        }
    }

}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView.tag == 0) {
            return categories?.count ?? 0
        } else {
            return packedStores?[collectionView.tag - 1].stores?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView.tag == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "little", for: indexPath) as! LittleCollectionViewCell
            cell.bind(with: categories?[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "big", for: indexPath) as! BigCollectionViewCell
            cell.bind(with: packedStores?[collectionView.tag - 1].stores?[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView.tag == 0) {
            // Ici pour les categories
        } else {
            // Ici pour les magasins
            let store = packedStores?[collectionView.tag - 1].stores?[indexPath.row]
            let sender = [
                "store": store,
                "categories": store?.getCategories()
                ] as [String : Any?]
            performSegue(withIdentifier: "storeDetail", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UINavigationController {
            if let data = sender as? [String: Any?] {
                if let storeController = destination.viewControllers.first as? StoreController {
                    storeController.store = data["store"] as? Store
                    storeController.categories = data["categories"] as? [Categorie]
                }
            }
        }
    }
    
}

