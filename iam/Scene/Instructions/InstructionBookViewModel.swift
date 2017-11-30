//
//  InstructionBookViewModel.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 30..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

final class InstructionBookViewModel: ViewModelType {
    struct Input {
        let fetching: PublishSubject<Void>
        //        let selection: Observable<IdexPath>
    }
    struct Output {
        let trigger: Observable<Bool>
    }
    
    init() {
        
    }
    
    func inOutTransform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        //        let cates = input.trigger.flatMapLatest {_ in
        //            return self.useCase
        //                .answers(user: User(uid: "", nickName: "", email: "", name: "", phone: "", certiUrl: ""))
        //                .trackActivity(activityIndicator)
        //                .asDriverOnErrorJustComplete()
        //                .map { $0 }
        //        }
        return Output(trigger: activityIndicator.asObservable())
    }
}

