//
//  ViewModelCategory.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import Worker
import RxSwift
import RxCocoa

final class ViewModelCategory: FlowableType {
    struct Input {
        let triger: Observable<Void>
        let selection: Observable<IndexPath>
    }
    struct Output {
//        let done: Observable<Bool>
        let categories: Driver<[ICategory]>
    }
    
    // Action
    let sceneTriger = BehaviorSubject(value: "")
    
    private let useCase: UseCaseCategory
    
    init(useCase: UseCaseCategory) {
        self.useCase = useCase
    }
    
    func transformation(input: ViewModelCategory.Input) -> ViewModelCategory.Output {
        let activityIndicator = ActivityIndicator()
        let items = input.triger.flatMapLatest { _ in
            return self.useCase.categories()
                .trackActivity(activityIndicator)
        }.asDriverOnErrorJustComplete()
        return Output(categories: items)
    }
}

extension ViewModelCategory {
//    static func vend() -> UIViewController {
//        var vc = CategoryViewController()
////        vc.bindViewModel(to: self)
//        return vc
//    }
}
