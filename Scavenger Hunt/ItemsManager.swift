//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by John Xu on 9/24/15.
//  Copyright © 2015 Liuxizi Xu. All rights reserved.
//

import Foundation
import UIKit

class itemManager {
    var items = [ScavengerHuntItem]()
    
    // get the file path
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        if let documentsPath = directoryList.first{
            return documentsPath + "/ScavengerHuntItems"
        }
        
        assertionFailure("Could not determine where to save file")
        return nil
    }
    
    // save data to archieve file
    func save() {
        if let theArchievePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(items, toFile: theArchievePath) {
                print("We made it!")
            } else {
                assertionFailure("Could not save to \(theArchievePath)")
            }
        }
    }
    
    // read saved archieve file
    func unarchiveSavedItem() {
        if let theArchievePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchievePath) {
                items = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchievePath) as! [ScavengerHuntItem]
            }
        }
    }
    
    init() {
        unarchiveSavedItem()
    }
}