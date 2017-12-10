//
//  AppFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain
import Worker

final class AppFlowController: UIViewController, FlowControllerType {
    var showcase: Scene = .Main
    private let useCaseProvider: Domain.UseCaseProvider = Worker.UseCaseProvider()
    @IBOutlet weak var lbIntro: UILabel!
    
    var currentVC: UIViewController?
    
    // create ContainerViewController in LoadView()
    override func loadView() {
        super.loadView()
        perform(from: self)
    }
    
    // ContainerViewController view becomes visible -> if you want make NSLayoutConstraint and activate.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("call viewWillLayoutSubviews")
    }
    
    override func viewDidLoad() {
        let time = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.showcase = .Category
            self.perform(from: self)
        }
    }
    
    func perform(from viewController: UIViewController) {
        if let vc = currentVC {
            removeChild(viewContoller: vc)
        }
        switch showcase {
        case .Login:
            currentVC = LoginFlowController.initFromStoryboard(name: .Login)
        case .Tutorial:
            currentVC = InstructionBookFlowController.initFromStoryboard(name: .Main)
        case .Main:
            currentVC = SampleFlowController()
        case .Category:
            currentVC = CategoryListFlowController()
        }
        // 원래는 네비게이션으로 넣는건데.. 컨테이너에 컨테이너 테스트겸 addChild로 넣어 봄.
        addChild(viewContoller: currentVC!)
//        self.navigationController?.pushViewController(currentVC!, animated: true)
    }
}

extension AppFlowController {
    enum Scene {
        case Login
        case Tutorial
        case Main
        case Category
    }
}
