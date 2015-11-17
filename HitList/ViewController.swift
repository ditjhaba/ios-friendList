//
//  ViewController.swift
//  HitList
//
//  Created by Ditjhaba Selemela on 2015/11/16.
//  Copyright © 2015 Ditjhaba Selemela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var names = [String]()

    @IBAction func addName(sender: AnyObject) {
        let alert = UIAlertController(title: "New Name", message: "Add a new name.", preferredStyle: .Alert)
        
        let save = UIAlertAction(title: "Save", style: .Default) { (UIAlertAction) -> Void in
            let textField = alert.textFields?.first
            self.names.append((textField?.text)!)
            self.tableView?.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler { (UITextField) -> Void in
        }
        
        alert.addAction(save)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell!.textLabel?.text = names[indexPath.row]
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

