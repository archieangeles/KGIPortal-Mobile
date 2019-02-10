//
//  MyProfile.swift
//  KGIPortalMobile
//
//  Created by Archimedes Angeles on 11/2/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import Foundation

struct PersonalInfo {

    var imageName: String?
    var fullName: String?
    var personalEmail: String?
    var mobileNumber: String?
    var address: String?

}

struct CompanyInfo {
    
    var loginName: String?
    var companyId: String?
    var companyEmail: String?
    var phoneNumber: String?
    
    var myLoginHistory: [LoginHistory] = []
    var mySystemRoles: [SystemRoles] = []

}


struct ProfileFields {
    var fieldName: String
    var fieldValue: String
    var sortOrder: Int
    
}
