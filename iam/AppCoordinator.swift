//
//  AppCoordinator.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 10..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

struct AppCoordinator {
    static var navi = UINavigationController()
    static func currentController(error: Error) -> UIViewController {
        let viewModel = SampleViewModel()
        var sampleVc = SampleViewController.initFromStoryboard(name: .Main)
        let naviController = UINavigationController()
        sampleVc.bindViewModel(to: viewModel)
        naviController.viewControllers = [sampleVc]
        
        
        
        return naviController
    }
}
