//
//  CategoryListViewModel.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa

final class CategoryListViewModel: ViewModelType {
    struct Input {
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Observable<Bool>
        let categories: Driver<[IamCategory]>
//        let selectedCategory: Driver<IamCategory>
    }
    
    private let useCase: CategoryUseCase
    private let flowController: CategoryListFlowController
    
    init(useCase: CategoryUseCase, flowController: CategoryListFlowController) {
        self.useCase = useCase
        self.flowController = flowController
    }
    
    func OutputTransformer(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let fetching = activityIndicator.asObservable()
        let cates = input.trigger.flatMapLatest {
            return self.useCase
                .Categories()
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map { $0 }
        }
//        let selectedCategory = input.selection
//            .withLatestFrom(cates) { (indexPath, categories) -> IamCategory in
//                return categories[indexPath.row].post
//        }
        return Output(fetching: fetching, categories: cates)
    }
}
