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

extension Categorie : Equatable {
    static func == (lhs: Categorie, rhs: Categorie) -> Bool {
        return (lhs.customisables == rhs.customisables &&
                lhs.imageUrl == rhs.imageUrl &&
                lhs.name == rhs.name)
    }
}

extension Customisables : Equatable {
    static func == (lhs: Customisables, rhs: Customisables) -> Bool {
        return (lhs.customisables == rhs.customisables &&
                lhs.maximumSelection == rhs.maximumSelection &&
                lhs.multipleSelection == rhs.multipleSelection &&
                lhs.title == rhs.title)
    }
}

extension Customisable : Equatable {
    static func == (lhs: Customisable, rhs: Customisable) -> Bool {
        return (lhs.name == rhs.name && lhs.state == rhs.state)
    }
}

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: Int) {
        self.init(displayP3Red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
/*
extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        let attributes = [NSAttributedStringKey.font: self]
        let attString = NSAttributedString(string: string,attributes: attributes)
        let framesetter = CTFramesetterCreateWithAttributedString(attString)
        return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0,length: 0), nil, CGSize(width: width, height: .greatestFiniteMagnitude), nil)
    }
}
*/
extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return NSString(string: string).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                                             options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                             attributes: [NSAttributedStringKey.font: self],
                                                             context: nil).size
    }
}
