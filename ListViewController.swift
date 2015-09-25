//
//  ListViewController.swift
//  Scavenger Hunt
//
//  Created by John Xu on 9/24/15.
//  Copyright © 2015 Liuxizi Xu. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    // create manger which can store items in archieve
    let myManager = itemManager()
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        let item = myManager.items[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    @IBAction func unwindToList (segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            
            let addVC = segue.sourceViewController as! AddViewController
            
            if let newItem = addVC.newItem {
                myManager.items += [newItem]
                // save the items to archieve
                myManager.save()
                let indexPath = NSIndexPath(forRow: myManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
}