//
//  QiitaItemViewController.swift
//  QiitaApp
//
//  Created by @0141Rice on 2016/02/18.
//  Copyright © 2016年 0141Rice. All rights reserved.
//

import UIKit

class QiitaItemViewController: UIViewController {

    @IBOutlet weak var qiitaField: UITextField!
    var press: QiitaItems? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pressQiita = press {
            qiitaField.text = pressQiita.item
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        if press != nil {
            press?.item = qiitaField.text
            press?.managedObjectContext!.MR_saveToPersistentStoreAndWait()
        } else {
            let newPress: QiitaItems = QiitaItems.MR_createEntity()!
            newPress.item = qiitaField.text
            newPress.managedObjectContext!.MR_saveToPersistentStoreAndWait()
        }
        
        navigationController!.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
