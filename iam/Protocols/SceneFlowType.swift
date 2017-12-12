//
//  SceneType.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 11..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

protocol SceneType: class {
    associatedtype Scene
    var showCase: Scene! { get set }
    func sceneSwitch(scene: Self.Scene)
    func perform(from viewController: UIViewController) -> Observable<Void>
}

extension SceneType where Self: UIViewController {
    func push(to flowController:UIViewController) {
        self.navigationController?.pushViewController(flowController, animated: true)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pop(to flowController:UIViewController) {
        self.navigationController?.popToViewController(flowController, animated: true)
    }
    
    func addChild(viewContoller vc: UIViewController) {
        addChildViewController(vc)
        view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    
    func removeChild(viewContoller vc: UIViewController) {
        vc.willMove(toParentViewController: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
    }
    
    func replace(from oldVc:UIViewController, to newVc:UIViewController) {
        if (oldVc === newVc) {
            print("Please. add diffrent viewController!")
            return
        }
        oldVc.willMove(toParentViewController: nil)
        addChildViewController(newVc)
        view.addSubview(newVc.view)
        newVc.view.alpha = 0
        newVc.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            oldVc.view.alpha = 0
            newVc.view.alpha = 1
        }) { finished in
            oldVc.view.removeFromSuperview()
            oldVc.removeFromParentViewController()
            newVc.didMove(toParentViewController: self)
        }
    }
}
