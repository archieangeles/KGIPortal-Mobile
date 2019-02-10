//
//  TaskJob.swift
//  TestProject
//
//  Created by Archimedes Angeles on 4/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import Foundation

struct TaskJob {
    var name: String
    var scheduleType: TaskJobScheduleType
    var status: TaskJobStatus
    var jobID: String
    var location: String
    var expectedTimingFrom: String
    var expectedTimingTo: String
    var isMondayEnabled: Bool
    var isTuesdayEnabled: Bool
    var isWednesdayEnabled: Bool
    var isThursdayEnabled: Bool
    var isFridayEnabled: Bool
    var isSaturdayEnabled: Bool
    var isSundayEnabled: Bool
    var isReRunable: Bool
}

enum TaskJobStatus: String
{
    case Success
    case Failed
    case NotSet
    
}

enum TaskJobScheduleType: String
{
    case Daily
    case Monthly
}
