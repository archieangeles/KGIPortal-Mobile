//
//  JobCellTableViewCell.swift
//  TestProject
//
//  Created by Archimedes Angeles on 4/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class JobCellTableViewCell: UITableViewCell {

    @IBOutlet weak var btnImageIcon: UIImageView!
    @IBOutlet weak var lblJobLabel: UILabel!
    @IBOutlet weak var lblJobTiming: UILabel!
    var jobId : String!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillLabels(taskDetail: TaskJob)
    {
        lblJobLabel.text = taskDetail.name
        lblJobTiming.text = "Timing: \(taskDetail.expectedTimingFrom)" 
        jobId = taskDetail.jobID
        
        if taskDetail.status == .Failed
        {
            btnImageIcon.image = UIImage(named: "failedicon")
        }
        else if taskDetail.status == .Success
        {
            btnImageIcon.image = UIImage(named: "successicon")
        }
        else
        {
            btnImageIcon.image = UIImage(named: "notseticon")
        }
        
    }

}
