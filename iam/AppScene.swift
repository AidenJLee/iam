//
//  AppScene.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 11..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import Domain
import Worker

final class AppScene: UIViewController, SceneType {
    var showCase: Scene! = .Main
    var currentVC: UIViewController?
    
    func sceneSwitch(scene: AppScene.Scene) {
        if let vc = currentVC {
            removeChild(viewContoller: vc)
        }
        switch scene {
        case .Login:
            currentVC = LoginViewController.initFromStoryboard(name: .Login)
        case .Main:
            currentVC = SampleViewController.initFromStoryboard(name: .Main)
        case .Category:
            currentVC = CategoryViewController.initFromStoryboard(name: .Main)
        }
        addChild(viewContoller: currentVC!)
    }
    
    func perform(from viewController: UIViewController) {
        
    }
    
    // create ContainerViewController in LoadView()
    override func loadView() {
        super.loadView()
        sceneSwitch(scene: .Main)
    }
    
    // ContainerViewController view becomes visible -> if you want make NSLayoutConstraint and activate.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("call viewWillLayoutSubviews")
        // 이런식으로 사이즈 업데이트... 나중에 snapkit으로 변경.
        //        NSLayoutConstraint.activate([
        //            self.currentVC.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
        //            self.currentVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
        //            self.currentVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        //            self.currentVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        //            ])
    }
    
    override func viewDidLoad() {
        let time = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.replace(from: self.currentVC!, to: LoginViewController.initFromStoryboard(name: .Login))
        }
    }
}

extension AppScene {
    enum Scene {
        case Login
        case Main
        case Category
    }
}
