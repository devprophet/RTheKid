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
    
    /// La distance du magasin par rapport à la position actuelle *(en mètres)*
    var distance: Double?
    
    /// L'adresse du magasin.
    var address: String?
    
    /// L'url de l'image du magasin.
    var imageUrl: String?
    
    /// Les produits que vend le magasin.
    var productSell: [Product]?
    
    /// Le type de magasin que c'est.
    var type: String?
    
    // TODO: Changer le type des parametres (CLLocation -> par ceux de Google)
    /// Calcule la distance entre la localisation géographique du magasin et celle de l'utilisateur.
    func calculateDistance(userLocation: CLLocation) {
        if let location = location {
            distance = userLocation.distance(from: location)
        }
    }
    
    /// Permet de récuperer les différentes categorie de produit en vente dans ce magasin
    /// - returns: Les différentes catégories de produits en vente dans ce magasin
    func getCategories() -> [Categorie]? {
        if let productsSell = productSell {
            var categories = [Categorie]()
            productsSell.forEach { x in
                if let categorie = x.categorie {
                    if(!categories.contains(where: { $0.name == x.name})) {
                        categories.append(categorie)
                    }
                }
            }
            return categories
        } else {
            return nil
        }
    }
    
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
    
    /// Si le numéro de l'utilisateur à était vérifier.
    var verified: Bool?
    
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

/// Représente un élément customisable.
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
            if let index = customisables.index(where: { x in x.name == customisable.name }) {
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
                        if let _index = self.customisables!.index(where: { y in y.name == x.name } ) {
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
    
    init(name: String?) {
        self.name = name
    }
    
}

/// Représente un ensembles de magasins ayant le même type.
class PackedStore {
    
    /// Le titre de l'ensemble.
    var title: String?
    
    /// Les magasins ayant le même type.
    var stores: [Store]?
    
    /// Le type de magasin que accepte cette ensemble.
    var type: String
    
    init(title: String?, type: String) {
        self.title = title
        self.type = type
    }
    
    convenience init(title: String?, type: String, stores: [Store]?) {
        self.init(title: title, type: type)
        add(stores: stores)
    }
    
    /// Ajoute un ou plusieurs magasins dans cette ensemble.
    func add(stores: [Store]?) {
        if(self.stores == nil) {
            self.stores = [Store]()
        }
        if let stores = stores {
            let sequences = stores.filter({ x in x.type == type })
            self.stores?.append(contentsOf: sequences)
        }
    }
    
}

class ServerData {
    var users: [User]?
    var stores: [Store]?
    
    func GetPackedStores() -> [PackedStore]{
        var packedStores = [PackedStore]()
        stores?.forEach({store in
            if let storeType = store.type {
                if (packedStores.contains(where: {$0.type == storeType})) {
                    let index = packedStores.index(where: {$0.type == storeType})!
                    packedStores[index].add(stores: [store])
                } else {
                    let packedStore = PackedStore(title: storeType + " à proximité", type: storeType, stores: [store])
                    packedStores.append(packedStore)
                }
            }
        })
        return packedStores
    }
    
    func GetCategories(with: [PackedStore]?) -> [Categorie]? {
        guard let packedStores = with else { return nil }
        var categories = [Categorie]()
        packedStores.forEach({ packedStore in
            if let stores = packedStore.stores {
                stores.forEach({ s in
                    if let products = s.productSell {
                        products.forEach( { p in
                            if let categorie = p.categorie {
                                if(!categories.contains(where: { $0.name == categorie.name })) {
                                    categories.append(categorie)
                                }
                            }
                        })
                    }
                })
            }
        })
        return categories
    }
    
}
