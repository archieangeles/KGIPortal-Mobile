//
//  SideMenuVCTableViewController.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 10/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class SideMenuVCTableViewController: UITableViewController {

    
    @IBAction func onMenuTapped()
    {
        print("Print toggle side menu")
        
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
        switch indexPath.row {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name("ShowDailyJobStatus"), object: nil)
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name("ShowProfile"), object: nil)
        case 2:
            NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
        default:
            break
        }
        
    }

   

   

}
