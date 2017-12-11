//
//  SampleViewModel.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa

final class SampleViewModel: FlowableType {
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
    
    func transformation(input: SampleViewModel.Input) -> SampleViewModel.Output {
        let activityIndicator = ActivityIndicator()
        return Output(fetching: activityIndicator.asObservable())
    }
}

