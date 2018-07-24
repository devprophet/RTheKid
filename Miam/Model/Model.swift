//
//  Model.swift
//  Miam
//
//  Created by Alexis Gougaut on 24/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit
import CoreLocation

/// Représente un magasin.
class Store {
    
    /// Le nom du magasin.
    var name: String?
     
    /// Le(s) propriétaire(s) du magasin.
    var owners: [Owner]?
    
    // TODO: Changer CLLocation par celui de Google.
    /// La localisation géographique du magasin.
    var location: CLLocation?
    
    /// L'adresse du magasin.
    var address: String?
    
    /// L'url de l'image du magasin.
    var imageUrl: String?
    
    /// Les produits que vend le magasin.
    var productSell: [Product]?
    
    /// Le type de magasin que c'est.
    var type: String?
}

/// Représente une catégorie.
class Categorie {
    
    /// Le nom de la catégorie.
    var name: String?
    
    /// L'url de l'image de la categorie.
    var imageUrl: String?
    
}

/// Représente un propriétaire
class Owner {
    
    /// Le compte utilisateur du propriétaire.
    var user: User?
    
    /// Le niveau de modification du propriétaire.
    var level: Int?
    
}

/// Représente un utilisateur.
class User {
    
    /// Le prénom de l'utilisateur.
    var name: String?
    
    /// Le nom de l'utilisateur.
    var surname: String?
    
    /// Le numéro de téléphone de l'utilisateur qui et **unique** par utilisateurs.
    var phone: String?
    
}

/// Représente un produit en vente.
class Product {
    
    /// Le nom du produit.
    var name: String?
    
    /// La categorie auquel appartient le produit.
    var categorie: Categorie?
    
    /// Le prix du produit.
    var price: Float?
    
    /// Les éléments customisables du produits.
    var customisables: [Customisables]?
    
}

class Customisables {
    
    /// Le titre de cette categorie d'éléments a customiser
    var title: String?
    
    /// Les elements a customiser.
    var customisables: [Customisable]?
    
    /// Autorise la séléction de plusieurs élement à customiser.
    var multipleSelection: Bool = false
    
    /// Le maximum d'élement a customiser qu'on peut sélectionner.
    var maximumSelection: Int = 0
    
    /// Retourne `true` si on peut selectioner un élément customisable sinon retourne `false`.
    /// - returns: `true` si on peut selectioner sinon `false`.
    private func canSelect() -> Bool {
        if let customisables = customisables {
            if customisables.filter( { x in x.state == true } ).count < maximumSelection {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    
    /// Selectionne un élément à customiser. Inverse son status.
    /// - parameter customisable: Le customisable à selectionner.
    func select(customisable: Customisable) {
        if let customisables = customisables {
            if let index = customisables.firstIndex(where: { x in x.name == customisable.name }) {
                if multipleSelection {
                    if !customisables[index].state {
                        if canSelect() {
                            self.customisables![index].state = !customisables[index].state
                        }
                    } else {
                        self.customisables![index].state = !customisables[index].state
                    }
                } else {
                    self.customisables!.forEach { x in
                        if let _index = self.customisables!.firstIndex(where: { y in y.name == x.name } ) {
                            if _index != index {
                                self.customisables![_index].state = false
                            } else {
                                self.customisables![_index].state = !self.customisables![_index].state
                            }
                        }
                    }
                }
            }
        }
    }
    
}

/// Représentation d'un élément à customiser.
class Customisable {
    
    /// Le nom de l'élément à customiser.
    var name: String?
    
    /// Le statut de l'élément à customiser (séléctionner `true` ou pas `false`).
    var state: Bool = false
    
}
