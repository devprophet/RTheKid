//
//  HomeController.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    var data = ServerData()
    var dataIndexed = [String: Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crée une categorie pour notre produit
        let productCategorie = Categorie()
        productCategorie.name = "Snack"
        productCategorie.imageUrl = "http://www.google.fr/"
        
        // Crée des customisables pour notre produit
        let customisables = Customisables()
        customisables.title = "Choisi ta base"
        customisables.customisables = [Customisable]()
        customisables.customisables?.append(contentsOf: [
                Customisable(name: "Poulet"),
                Customisable(name: "Jambon"),
                Customisable(name: "Bouchons"),
                Customisable(name: "Steak")
        ])
        customisables.multipleSelection = false
        customisables.maximumSelection = 0
        
        // Crée un produit
        let product = Product()
        product.categorie = productCategorie
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
        store.imageUrl = "http://www.google.fr/"
        store.owners = [Owner]()
        store.owners!.append(Owner())
        store.owners![0].user = user
        store.owners![0].level = -1
        store.distance = 1542
        store.productSell = [Product]()
        store.type = "Snack"
        
        // Crée un data
        data.users = [User]()
        data.users?.append(user)
        
        data.stores = [store]
        
        // Le process normale
        dataIndexed = data.StoresByType()
        
    }
    
    /// Le nombre de sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // data.stores.
        return 2
    }
    
    /// Le nombre de row dans la section passez en parametre
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    /// La cellule coresspondant à la row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "0", for: indexPath)
    }

}

/*
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)
    }
    
}
*/
