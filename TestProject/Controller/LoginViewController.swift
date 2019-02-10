//
//  LoginViewController.swift
//  TestProject
//
//  Created by Archimedes Angeles on 29/1/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @objc func pushNotificationHandler(_ notification : NSNotification) {
        // self.udateUI() // Add code to show a specific view on tap.
        
        performSegue(withIdentifier: "dailyreport", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushNotificationHandler(_:)) , name: NSNotification.Name(rawValue: "NewNotification"), object: nil)
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }

        setNeedsStatusBarAppearanceUpdate()
        
        // Do any additional setup after loading the view.
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        
        
        txtUserName.layer.cornerRadius = 5
        txtUserName.layer.borderWidth = 1
        txtUserName.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        txtPassword.layer.cornerRadius = 5
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
