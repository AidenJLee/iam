//
//  SampleFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Worker

class SampleFlowController: UIViewController, FlowControllerType {
    var viewModel: SampleViewModel!
    var containerVC: SampleViewController!
    
    func perform(from viewController: UIViewController) {
//        let service = Worker.UseCaseProvider()
        viewModel = SampleViewModel()
        containerVC = SampleViewController.initFromStoryboard(name: .Main)
        containerVC.bindViewModel(to: viewModel)
        addChild(viewContoller: containerVC)
    }
    
    override func loadView() {
        super.loadView()
        perform(from: self)
    }
}
