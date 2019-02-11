//
//  LoginHistoryViewController.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 11/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class LoginHistoryViewController: UIViewController {

    
    var loginHis: [LoginHistory] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let barBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = barBackButton
        
        self.title = "LOGIN HISTORY"
        
        getMyLoginHistory(loginId: "abc12345") { (loginX) in
            self.loginHis = loginX
            
        }
    }
    


}


extension LoginHistoryViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginHis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let currentData = loginHis[indexPath.row]
        
        let format = DateFormatter()
        format.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        
        cell.textLabel?.text = format.string(from: currentData.loginDateTime!)
        cell.detailTextLabel?.text = "IP: \(currentData.ipAddress!), Platform \(String(describing: currentData.platForm))"
        
        if currentData.platForm == "Mobile Apps"
        {
            cell.imageView?.image = UIImage(imageLiteralResourceName: "mobile")
        }
        else
        {
            cell.imageView?.image = UIImage(imageLiteralResourceName: "web")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "MY LOGIN HHISTORY"
        }
        
        return ""
    }
    
    
}
