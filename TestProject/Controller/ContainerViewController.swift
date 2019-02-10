//
//  ContainerViewController.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 10/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
        
    }
    
    var isSideMenuOpen = false
    
    @objc func toggleSideMenu()
    {
        if isSideMenuOpen
        {
            sideMenuConstraint.constant = -240
            isSideMenuOpen = false
            
        }
        else{
            sideMenuConstraint.constant = 0
            isSideMenuOpen = true
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    

   

}
