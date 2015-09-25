//
//  AddViewController.swift
//  Scavenger Hunt
//
//  Created by John Xu on 9/24/15.
//  Copyright © 2015 Liuxizi Xu. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var newItem: ScavengerHuntItem?
    
    // create a new item for the list and go back to the list view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    newItem = ScavengerHuntItem(name: name)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // cancel button: go back to the list view
    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

