//
//  ForgotPasswordViewController.swift
//  TestProject
//
//  Created by Archimedes Angeles on 4/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnReset.layer.cornerRadius = 5
        
    }
    
    @IBAction func btnClosedClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnResetClick(_ sender: Any) {
        
        let alert = UIAlertController(title: "Reset Password", message: "Password has been reset, please check your registered email for details", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
        
    }
    
}
