//
//  PopUpCalendarViewController.swift
//  TestProject
//
//  Created by Archimedes Angeles on 5/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

protocol PopCalendarDelegate {
    
    func selectedDate(date: Date, isToday: Bool)
}


class PopUpCalendarViewController: UIViewController {

    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var viewCalendarContainer: UIView!
    @IBOutlet weak var myCalendar: UIDatePicker!
    @IBOutlet weak var btnToday: UIButton!
    
    var calendardelegate: PopCalendarDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        btnSelect.layer.cornerRadius = 5
        
        btnCancel.layer.cornerRadius = 5
        
        btnToday.layer.cornerRadius = 5
        
        
        viewCalendarContainer.layer.cornerRadius = 5
    }
    
    @IBAction func btnCancelClick(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnSelectClick(_ sender: Any) {
        
        if calendardelegate != nil
        {
            self.calendardelegate?.selectedDate(date: myCalendar.date, isToday: false)
            
            print("From pop up: \(myCalendar.date)")
            
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnTodayClick(_ sender: Any) {
        
        if calendardelegate != nil
        {
            
            myCalendar.setDate(Date(), animated: false)
            
            self.calendardelegate?.selectedDate(date: myCalendar.date, isToday: true)
            
            print("From pop up: \(myCalendar.date)")
            
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}
