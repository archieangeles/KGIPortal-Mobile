//
//  MyProfileDB.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 11/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import Foundation
import UIKit

func getMyProfile(loginId: String, myProfile: @escaping ([ProfileFields]) -> Void)
{
    
    
    
    var prof: [ProfileFields] = []
    
   
    prof.append(ProfileFields.init(fieldName: "Full Name", fieldValue: "Angeles Archimedes, Gatchalian", sortOrder: 1))
    prof.append(ProfileFields.init(fieldName: "Date Of Birth", fieldValue: "01-June-2010", sortOrder: 1))
    prof.append(ProfileFields.init(fieldName: "Personal Email", fieldValue: "archieangeles@gmail.com", sortOrder: 2))
    prof.append(ProfileFields.init(fieldName: "Mobile Number", fieldValue: "+65 8571 3568", sortOrder: 3))
    prof.append(ProfileFields.init(fieldName: "Address", fieldValue: "BLK 359 Admiralty Drive, Singapore 750359", sortOrder: 4))
    
    
//   personalInfo =  PersonalInfo.init(imageName: "profilepic.jpg", fullName: "Archimedes Angeles Gatchalian", personalEmail: "archieangeles@gmail.com", mobileNumber: "+65 8571 3568", address: "BLK 359 Admiralty Drive 08-192 Singapore 750359")

    myProfile(prof)
}

func getMyCompanyInfo(loginId: String, mycompanyInfo: @escaping ([ProfileFields]) -> Void)
{
    var prof: [ProfileFields] = []
    
    prof.append(ProfileFields.init(fieldName: "Login Id", fieldValue: "E0154", sortOrder: 0))
    prof.append(ProfileFields.init(fieldName: "Company Email", fieldValue: "archimedes.angeles@kgi.com", sortOrder: 1))
    prof.append(ProfileFields.init(fieldName: "Office Phone", fieldValue: "+65 6236 1566", sortOrder: 2))
    
    mycompanyInfo(prof)
}
