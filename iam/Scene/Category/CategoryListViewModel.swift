//
//  CategoryListViewModel.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

// Category: ["real me": "자아도취", "work": "직장생활백서", "habit": "좋은습관, 나쁜습관, 이상한 습관", "body": "거울 들여다보기", "emotion": "희노애락", "living": "생활의 재발견", "secret": "말할 수 있는 비밀", "money": "머니 액츄얼리", "man and woman": "남과 여", "travel": "여행 또는 여행처럼", "childhood": "어린시절 자화상", "familly": "가족이라는 이름", "love": "달콤 씁쓸한 사랑", "friends": "친구? 친구~ 친구!", "future": "미리 그린 미래", "decision": "그때는 틀리고 지금은 맞다", "happiness": "행복사고회로", "fear": "내 안에 숨어 있는 두려움", "death": "죽음이란 무엇인가" ]  // 낭만

import UIKit
import Domain
import RxSwift
import RxCocoa

final class CategoryListViewModel: ViewModelType {
    struct Input {
        let trigger: Observable<Void>
//        let selection: Observable<IdexPath>
    }
    struct Output {
        let fetching: Driver<Bool>
    }
    
    private let useCase: AnswerUseCase
    
    init(useCase: AnswerUseCase) {
        self.useCase = useCase
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
        return Output(fetching: activityIndicator.asDriver())
    }
}

