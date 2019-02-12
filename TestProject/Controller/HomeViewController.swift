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
        NotificationCenter.default.addObserver(self, selector: #selector(logoutMe), name: NSNotification.Name("LogoutMe"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyGen), name: NSNotification.Name("KeyGenNotification"), object: nil)
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
    
    @objc func logoutMe()
    {
        let logoutAlert = UIAlertController(title: "Logout Confirmation", message: "This will logout your current session. Are you sure you want to continue?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            print("You click yes button")
        })
        
        let noAction = UIAlertAction(title: "No", style: .cancel) { (action) in
            print("You click no button")
        }
        
        
        logoutAlert.addAction(yesAction)
        logoutAlert.addAction(noAction)
        
        self.present(logoutAlert,animated: true)
        
        
    }
    
    @objc func showKeyGen()
    {
        performSegue(withIdentifier: "ShowKeyGen", sender: nil)
    }


}
