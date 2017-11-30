//
//  FlowControllerType.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

protocol FlowControllerType: class {
    func perform(from viewController: UIViewController)
}

extension FlowControllerType where Self: UIViewController {
//    mutating func bindViewModel(_ model: Self.VMType) {
//        viewModel = model
//        loadViewIfNeeded()
//        bindViewModel()
//    }
}

// warning: 무쓸모.. 이제 코디네이터 안씀. 그래도 기념삼아 코드 남김. 나중에 지움!
//extension UIViewController {
//    func addContainer(childController: UIViewController) {
//        addChildViewController(childController)
//        view.addSubview(childController.view)
//        childController.didMove(toParentViewController: self)
//    }
//    func removeContainer(childController: UIViewController) {
//        childController.willMove(toParentViewController: nil)
//        childController.view.removeFromSuperview()
//        childController.removeFromParentViewController()
//    }
//    func transit(fromViewController: UIViewController, toViewController: UIViewController) {
//        fromViewController.willMove(toParentViewController: nil)
//        addChildViewController(toViewController)
//        transit(fromViewController: fromViewController, toViewController: toViewController)
//        self.transition(from: fromViewController, to: toViewController, duration: 0.25, options: UIViewAnimationOptions(rawValue: 0), animations: {
//            toViewController.view.frame = fromViewController.view.bounds
//            fromViewController.view.frame = CGRect.zero
//        }) { (finished) in
//            fromViewController.removeFromParentViewController()
//            toViewController.didMove(toParentViewController: self)
//        }
//    }
//}

