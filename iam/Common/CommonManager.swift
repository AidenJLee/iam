//
//  CommonManager.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

final class CM {
    // Login info
    var userId: String
    var userPwd: String
    var token: String
    
    // Tutorial
    var isComplatedTutorial: Bool
    
    
    static let shared = CM()
    private init() {
        userId = Defaults[.userId]
        userPwd = Defaults[.userPwd]
        token = Defaults[.token]
        isComplatedTutorial = Defaults[.isComplatedTutorial]
    }
}

extension DefaultsKeys {
    static let userId = DefaultsKey<String>("userId")
    static let userPwd = DefaultsKey<String>("userPwd")
    static var token = DefaultsKey<String>("token")
    static let isComplatedTutorial = DefaultsKey<Bool>("isComplatedTutorial")
}
