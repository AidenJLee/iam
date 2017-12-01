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
    
}
