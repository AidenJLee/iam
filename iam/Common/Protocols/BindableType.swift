//
//  BindableType.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

protocol BindableType {
    associatedtype VMType
    var viewModel: VMType { get set }
    func bindViewModel()
    func assertDependencies()
}

extension BindableType where Self: UIViewController {
    mutating func setViewModel(_ model: Self.VMType) {
        viewModel = model
        loadViewIfNeeded()
    }
}
