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
    var itemsList = [ScavengerHuntItem(name: "Cat"),
                    ScavengerHuntItem(name: "Bird"),
                    ScavengerHuntItem(name: "💩")]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    @IBAction func unwindToList (segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            
            let addVC = segue.sourceViewController as! AddViewController
            
            if let newItem = addVC.newItem {
                itemsList += [newItem]
                let indexPath = NSIndexPath(forRow: itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
}