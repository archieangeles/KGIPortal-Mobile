//
//  PersonListViewController.swift
//  SampleCoreData
//
//  Created by Archimedes Angeles on 20/3/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit




class PersonListViewController: UIViewController, AddPersonProtocol  {
    
    
    
    
    func operationResult(isSuccess: Bool) {
    
        print("Deleage New record has been saved \(isSuccess)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnNewPersonClick(_ sender: Any) {
        
        performSegue(withIdentifier: "segaddperson", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segaddperson"
        {
            let vc: ViewController  = segue.destination as! ViewController
            
            vc.del = self
        }
    }
    
    
    
    

}
