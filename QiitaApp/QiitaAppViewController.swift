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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qiitaEntities = QiitaItems.MR_findAll() as? [QiitaItems]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return qiitaEntities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListItem")!
        cell.textLabel!.text = qiitaEntities[indexPath.row].item
        return cell
    }


}

