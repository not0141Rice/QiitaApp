//
//  ViewController.swift
//  QiitaApp
//
//  Created by @0141Rice on 2016/02/17.
//  Copyright © 2016年 0141Rice. All rights reserved.
//

import UIKit

class QiitaAppViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var qiitaEntities: [QiitaItems]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        qiitaEntities = QiitaItems.MR_findAll() as? [QiitaItems]
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qiitaEntities = QiitaItems.MR_findAll() as? [QiitaItems]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit" {
            let qiitaController = segue.destinationViewController as! QiitaItemViewController
            let press = qiitaEntities[tableView.indexPathsForSelectedRows!.first!.row]
            qiitaController.press = press
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            qiitaEntities.removeAtIndex(indexPath.row).MR_deleteEntity()
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return qiitaEntities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListItem")!
        cell.textLabel!.text = qiitaEntities[indexPath.row].item
        return cell
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }


}

