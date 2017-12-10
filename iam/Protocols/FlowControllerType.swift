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
    func push(to vc:UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pop(to vc:UIViewController) {
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    func addChild(viewContoller childController: UIViewController) {
        addChildViewController(childController)
        view.addSubview(childController.view)
        // add AutoLayout code....
        childController.didMove(toParentViewController: self)
    }
    
    func removeChild(viewContoller childController: UIViewController) {
        childController.willMove(toParentViewController: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParentViewController()
    }
    
    func replace(from a:UIViewController, to b:UIViewController) {
        removeChild(viewContoller: a)
        addChild(viewContoller: b)
    }
}
