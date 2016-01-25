//
//  ViewController.swift
//  College Profile
//
//  Created by Garrett Haufschild on 1/20/16.
//  Copyright © 2016 Swag Productions. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var collegeHolder: UITableView!
    
    var colleges: [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        
        colleges.append(College(name: "The Ohio State University", location: "Columbus, Ohio", mascot: "Brutus Buckeyes", colors: "Grey and Scarlet", act: 28, enrollment: 64868, image: UIImage(named: "Ohio State")!))
        colleges.append(College(name: "Illinois University at Urbana-Champaign", location: "Urbana-Champaign, Illinois", mascot: "Fighting Illini", colors: "Blue and Orange", act: 28, enrollment: 44087, image: UIImage(named: "UIUC")!))
        colleges.append(College(name: "Purdue", location: "West Lafayette, Indiana", mascot: "Boilermakers", colors: "Black and Old Gold", act: 30, enrollment: 38770, image: UIImage(named: "Purdue")!))
    }

    //Table View Functions
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            collegeHolder.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = collegeHolder.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        return cell
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    //Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = collegeHolder.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
    
    //IBActions
    @IBAction func onAddTapped(sender: AnyObject) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler{(textField) -> Void in textField.placeholder = "Which college are you looking at?"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.collegeHolder.reloadData()
        }
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func onEditTapped(sender: UIBarButtonItem) {
        if sender.tag == 0
        {
            collegeHolder.editing = true
            sender.tag = 1
        }
        else
        {
            collegeHolder.editing = false
            sender.tag = 0
        }
    }
}

