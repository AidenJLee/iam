//
//  CommonManager.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import ObjectMapper

final class CM {
    
    // Login info
    var userId: String
    var userPwd: String
    var token: String
    
    // Tutorial
    var isComplatedTutorial: Bool
    
    // UserInformation
    var userInfo: User?
    
    
    // ViewModels
//    let loginViewModel: LoginViewModel
//    let mainViewModel = MainViewModel()
    
    static let shared = CM()
    private init() {
        userId = Defaults[.userId]
        userPwd = Defaults[.userPwd]
        token = Defaults[.token]
        isComplatedTutorial = Defaults[.isComplatedTutorial].boolValue
//        loginViewModel =  LoginViewModel(id: userId, pwd: userPwd)
//        mainViewModel.sendAppInfoAPI()
    }
}

extension DefaultsKeys {
    static let userId = DefaultsKey<String>("userId")
    static let userPwd = DefaultsKey<String>("userPwd")
    static var token = DefaultsKey<String>("token")
    static let isComplatedTutorial = DefaultsKey<Bool>("isComplatedTutorial")
}
