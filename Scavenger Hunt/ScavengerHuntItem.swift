//
//  ScavengerHuntItem.swift
//  Scavenger Hunt
//
//  Created by John Xu on 9/24/15.
//  Copyright © 2015 Liuxizi Xu. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    // add keys for achieve
    let nameKey = "name"
    let photoKey = "photo"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey:photoKey)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage
    }
    
    init(name: String) {
        self.name = name
    }
}