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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dailyJobList.append(TaskJob.init(name: "BRPS HK to SG Client Static Data", scheduleType: .Daily, status: .NotSet, jobID: "HKTOSG1001", location: "HKSERVER01", expectedTimingFrom: "04:30 AM", expectedTimingTo: "04:35 PM,", isMondayEnabled: true, isTuesdayEnabled: true, isWednesdayEnabled: true, isThursdayEnabled: true, isFridayEnabled: true, isSaturdayEnabled: true, isSundayEnabled: false))
        
        dailyJobList.append(TaskJob.init(name: "BRPS HK to SG Intrument Static Data", scheduleType: .Daily, status: .NotSet, jobID: "HKTOSG1002", location: "HKSERVER01", expectedTimingFrom: "04:30 AM", expectedTimingTo: "04:35 PM,", isMondayEnabled: true, isTuesdayEnabled: true, isWednesdayEnabled: true, isThursdayEnabled: true, isFridayEnabled: true, isSaturdayEnabled: true, isSundayEnabled: false))
        
        
        dailyJobList.append(TaskJob.init(name: "BRPS HK to SG Trades", scheduleType: .Daily, status: .NotSet, jobID: "HKTOSG1003", location: "HKSERVER01", expectedTimingFrom: "04:30 AM", expectedTimingTo: "04:35 PM,", isMondayEnabled: true, isTuesdayEnabled: true, isWednesdayEnabled: true, isThursdayEnabled: true, isFridayEnabled: true, isSaturdayEnabled: true, isSundayEnabled: false))
        
        dailyJobList.append(TaskJob.init(name: "GL Enrich Data", scheduleType: .Daily, status: .NotSet, jobID: "GLEN1001", location: "GLDB", expectedTimingFrom: "04:30 AM", expectedTimingTo: "04:35 PM,", isMondayEnabled: true, isTuesdayEnabled: true, isWednesdayEnabled: true, isThursdayEnabled: true, isFridayEnabled: true, isSaturdayEnabled: true, isSundayEnabled: false))
        
        dailyJobList.append(TaskJob.init(name: "GL Initial Position", scheduleType: .Daily, status: .NotSet, jobID: "GLEN1002", location: "GLDB", expectedTimingFrom: "06:30 AM", expectedTimingTo: "04:35 PM,", isMondayEnabled: true, isTuesdayEnabled: true, isWednesdayEnabled: true, isThursdayEnabled: true, isFridayEnabled: true, isSaturdayEnabled: true, isSundayEnabled: false))
        
        dailyJobList.append(TaskJob.init(name: "GL Groupdef Generator", scheduleType: .Daily, status: .NotSet, jobID: "GLEN1003", location: "GLDB", expectedTimingFrom: "06:30 AM", expectedTimingTo: "04:35 PM,", isMondayEnabled: true, isTuesdayEnabled: true, isWednesdayEnabled: true, isThursdayEnabled: true, isFridayEnabled: true, isSaturdayEnabled: true, isSundayEnabled: false))
        
        
        dailyJobList.append(TaskJob.init(name: "GL Capital and PMO", scheduleType: .Daily, status: .NotSet, jobID: "GLEN1004", location: "GLDB", expectedTimingFrom: "06:30 AM", expectedTimingTo: "04:35 PM,", isMondayEnabled: true, isTuesdayEnabled: true, isWednesdayEnabled: true, isThursdayEnabled: true, isFridayEnabled: true, isSaturdayEnabled: true, isSundayEnabled: false))
        
        
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
    
    
}

