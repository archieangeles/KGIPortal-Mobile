//
//  ViewController.swift
//  TestProject
//
//  Created by Archimedes Angeles on 26/1/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit
import Foundation

class DailyReportController: UIViewController {

    var dailyJobList = [TaskJob]()
    var selectDate = Date()
    
    @IBOutlet weak var lblHeaderDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadTables(date: selectDate)
        
        
        
    }

    @IBAction func calendarIconClick(_ sender: Any) {
        
       
        performSegue(withIdentifier: "popupvc", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popupvc"
        {
            let vc: PopUpCalendarViewController = segue.destination as! PopUpCalendarViewController
            
            vc.calendardelegate = self
            
        }
    }
    
    
    func loadTables(date: Date) {
        getTaskList(reportDate: Date()) { (taskList) in
            self.dailyJobList.append(contentsOf: taskList)
            
            DispatchQueue.main.async {
                self.viewWillAppear(true)
            }
            
            print("Load tables has been called!")
        }
    }
    
    
    
    
}

extension DailyReportController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyJobList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobcell", for: indexPath) as! JobCellTableViewCell
        
        cell.fillLabels(taskDetail: dailyJobList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actions = UIContextualAction(style: .normal, title: "Actions") { (action, view, handler) in
            print("Actions was tapped")
            
            let alertController = UIAlertController(title: "Task Actions", message: "This action may effect on the job performance", preferredStyle: .actionSheet)
            
            alertController.addAction(UIAlertAction(title: "Create Email Alert", style: .default, handler: { (_) in
                print("Create Email Alert was pressed")
            }))
            
            alertController.addAction(UIAlertAction(title: "Mark For Later Review", style: .default, handler: { (_) in
                print("Later review was pressed")
            }))
            
            alertController.addAction(UIAlertAction(title: "Alert The Support Team", style: .default, handler: { (_) in
                print("Cancel alert was pressed")
            }))
            
            alertController.addAction(UIAlertAction(title: "Re-Run The Job", style: .destructive, handler: { (_) in
                print("Re-run action was pressed")
            }))
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                print("Cancel button was pressed")
            }))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        
        actions.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.137254902, blue: 0.2745098039, alpha: 1)
        
//        let deleteAction = UIContextualAction(style: .normal, title: "Action") { (action, view, (Bool) -> Void) in
//            print("Delete action was tapped")
//        }
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [actions])
        
        swipeConfig.performsFirstActionWithFullSwipe = false
        return swipeConfig
    }
    
    
}

extension DailyReportController : PopCalendarDelegate
{
    func selectedDate(date: Date, isToday: Bool) {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MMM-yyyy"
        
        if isToday
        {
            lblHeaderDate.text = "Today: \(dateFormat.string(from: date))"
        }
        else
        {
            
            lblHeaderDate.text = "Selected Date: \(dateFormat.string(from: date))"
            
        }
        
        loadTables(date: date)
        
        print("Receiver : \(date)")
        
        
    }
    
    
    
    
    
    
}

