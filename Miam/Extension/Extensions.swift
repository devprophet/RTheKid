//
//  Extensions.swift
//  Miam
//
//  Created by Alexis Gougaut on 25/07/2018.
//  Copyright © 2018 Alexis Gougaut. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Récupère une image depuis le web et l'affiche.
    /// - parameter fromUrl: L'url de l'image à afficher dans l'ImageView.
    func loadImage(fromUrl url: String?) {
        if let url = url {
            if let Url = URL(string: url) {
                URLSession.shared.dataTask(with: Url, completionHandler: { data, response, err in
                    if let err = err {
                        print("Error when loading image at \"\(url)\"\n\(err.localizedDescription)")
                    } else {
                        if let data = data {
                            if let image = UIImage(data: data) {
                                self.image = image
                            } else {
                                print("Error: The data is not an image!")
                            }
                        } else {
                            print("Error: The data is nil!")
                        }
                    }
                }).resume()
            }
        }
    }
}
