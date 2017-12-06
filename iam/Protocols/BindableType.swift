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
    var bag: DisposeBag { get }
    var viewModel: VMType! { get set }
    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    mutating func bindViewModel(to model: Self.VMType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
    func bind<T>(variable: Variable<T>, _ observer: AnyObserver<T>) {
        variable.asObservable()
            .bind(to: observer)
            .disposed(by: bag)
    }
}
