//
//  BaseViewController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

protocol Shakeable { }

class BaseViewController: UIViewController, BindableType {
    typealias T = String
    var viewModel: String!
    func bindViewModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()    // Check Dependencies
    }
    
    func assertDependencies() {
        
    }
}

extension Shakeable where Self: UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-15.0, 14.0, -10.0, 9.0, -6.0, 5.0, -3.0, 2.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
