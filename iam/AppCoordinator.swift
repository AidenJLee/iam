//
//  AppCoordinator.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: Coordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        guard let naviController = window.rootViewController as? UINavigationController else {
            return Observable.never()
        }
        naviController.setViewControllers(EntryViewController.initFromStoryboard(name: "Main"), animated: false)
        return coordinate(to: repositoryListCoordinator)
    }
}
