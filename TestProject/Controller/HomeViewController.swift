//
//  HomeViewController.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 10/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(showDailyJobStatus), name: NSNotification.Name("ShowDailyJobStatus"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showMyProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name("ShowSettings"), object: nil)
    }
    
    @IBAction func onMenuTapped()
    {
        print("Print toggle side menu")
        
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    @objc func showDailyJobStatus() -> Void {
        performSegue(withIdentifier: "ShowDailyJobStatus", sender: nil)
    }
    
    @objc func showMyProfile() -> Void {
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    
    
    @objc func showSettings() -> Void {
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }


}
