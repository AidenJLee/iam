//
//  ServiceFactory.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

enum ViewState {
    case Empty
    case Requesting
    case Done
    case Error(Error)
    
    func fetchEnabled() -> Bool {
        switch self {
        case .Empty, .Done:
            return true
        default:
            return false
        }
    }
}
