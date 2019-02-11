//
//  ShowRolesViewController.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 11/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class ShowRolesViewController: UIViewController {

    
    var roles: [SystemRoles] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        getMyRoles(loginId: "abc12345") { (role) in
            self.roles = role
            
        }
        
//        self.navigationController?.title = "MY ROLES"
//
        
//
        self.title = "MY ROLES"
        
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    

    
}

extension ShowRolesViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = roles[indexPath.row].roleName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "GRANTED ROLES"
        default:
            return ""
        }
    }
    
    
}
