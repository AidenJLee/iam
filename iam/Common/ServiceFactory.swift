//
//  ServiceFactory.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
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




// 화면 구현한게 없어서 재미삼아...
protocol Shakeable { }
extension Shakeable where Self: UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-15.0, 14.0, -10.0, 9.0, -6.0, 5.0, -3.0, 2.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

