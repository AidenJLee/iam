//
//  ConfigurationStores.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 8..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Foundation

// 앱 전반에 쓰이는 것을 모아 두는 곳
enum ViewState {    // 현재 View의 상태에 따라서 다르게 뷰를 보여줌.
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
