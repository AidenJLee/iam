//
//  SceneSample.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Worker

class SceneSample: UIViewController, SceneType {
    var showCase: Scene! = .SampleTwo
    var currentVC: UIViewController?
    
    var viewModel: SampleViewModel!
    var containerVC: SampleViewController!
    
    func sceneSwitch(scene: SceneSample.Scene) {
        if let vc = currentVC {
            removeChild(viewContoller: vc)
        }
        switch scene {
        case .SampleTwo:
            currentVC = LoginViewController.initFromStoryboard(name: .Login)
        case .SampleThree:
            currentVC = SampleViewController.initFromStoryboard(name: .Main)
        }
        addChild(viewContoller: currentVC!)
    }
    
    func perform(from viewController: UIViewController) {
        
    }
    
    override func loadView() {
        super.loadView()
        sceneSwitch(scene: .SampleTwo)
    }
}

extension SceneSample {
    enum Scene {
        case SampleTwo
        case SampleThree
    }
}
