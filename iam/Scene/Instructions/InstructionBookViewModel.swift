//
//  InstructionBookViewModel.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 30..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa

final class InstructionBookViewModel: ViewModelType {
    struct Input {
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Observable<Bool>
    }
    // Action
    let viewState = Variable(ViewState.Empty)
    
    init() {
        
    }
    
    func OutputTransformer(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        return Output(fetching: activityIndicator.asObservable())
    }
}
