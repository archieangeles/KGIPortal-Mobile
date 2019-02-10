//
//  MyProfileViewController.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 11/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    var profiles: [ProfileFields] = []
    var compInfo: [ProfileFields] = []
    var otherInfo: [ProfileFields] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "MY PROFILE"
        
        getMyProfile(loginId: "abc12345") { (profile) in
            self.profiles = profile
            
            self.profilePicture.layer.cornerRadius = self.profilePicture.frame.width / 2
            self.profilePicture.layer.borderWidth = 1
            self.profilePicture.layer.masksToBounds = true
            self.profilePicture.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.profilePicture.clipsToBounds = true
            
            
        }
        
        getMyCompanyInfo(loginId: "abc12345") { (comp) in
            self.compInfo = comp
        }
        
        otherInfo.append(ProfileFields.init(fieldName: "Granted To Roles", fieldValue: "roles", sortOrder: 0))
        otherInfo.append(ProfileFields.init(fieldName: "Login History", fieldValue: "history", sortOrder: 1))
        
    }
    


}

extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return profiles.count
        case 1:
            return compInfo.count
        case 2:
            return otherInfo.count
        default:
            return 0
        }
        
        //return profiles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "PERSONAL INFO"
        case 1:
            return "COMPANY INFO"
        case 2:
            return "OTHER INFO"
        default:
            return "THIS WILL NOT HIT"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = profiles[indexPath.row].fieldValue
            cell.detailTextLabel?.text = profiles[indexPath.row].fieldName
            cell.accessoryType = .none
            cell.selectionStyle = .none
            cell.imageView?.image = nil
            return cell
        case 1:
            cell.textLabel?.text = compInfo[indexPath.row].fieldValue
            cell.detailTextLabel?.text = compInfo[indexPath.row].fieldName
            cell.selectionStyle = .none
            cell.accessoryType = .none
            cell.imageView?.image = nil
            return cell
        case 2:
            cell.textLabel?.text = otherInfo[indexPath.row].fieldName
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
            cell.detailTextLabel?.text = ""
            cell.imageView?.image =  UIImage(imageLiteralResourceName: otherInfo[indexPath.row].fieldValue)
            
        default:
            return cell
        }
        
        
        
        return cell
    }
    
    
}
