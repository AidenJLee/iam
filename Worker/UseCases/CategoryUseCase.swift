//
//  CategoryUseCase.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import Domain
import RxSwift

final class CategoryUseCase: Domain.CategoryUseCase {
    // Realm
    private let repository: AbstractRepository<IamCategory>
    
    init(repository: AbstractRepository<IamCategory>) {
        self.repository = repository
    }
    
    func categories() -> Observable<[IamCategory]> {
        return repository.queryAll()
    }
    
    func save(item: IamCategory) -> Observable<String> {
        return repository.save(entity: item)
    }
    
    // Network dummy data
    func CategoriesWithNetwork() -> Observable<[IamCategory]> {
        return createTeamCategoryArray()
    }
}

func createTeamCategoryArray() -> Observable<[IamCategory]> {
    var arrCategories = Array<IamCategory>()
    arrCategories.append(IamCategory(id: "1", name: "real me", depiction: "자아도취", aa: "none"))
    arrCategories.append(IamCategory(id: "2", name: "work", depiction: "직장생활백서", aa: "none"))
    arrCategories.append(IamCategory(id: "3", name: "habit", depiction: "좋은습관, 나쁜습관, 이상한 습관", aa: "none"))
    arrCategories.append(IamCategory(id: "4", name: "body", depiction: "거울 들여다보기", aa: "none"))
    arrCategories.append(IamCategory(id: "5", name: "emotion", depiction: "희노애락", aa: "none"))
    arrCategories.append(IamCategory(id: "6", name: "living", depiction: "생활의 재발견", aa: "none"))
    return Observable.from(optional: arrCategories)
}


// Category: ["real me": "자아도취", "work": "직장생활백서", "habit": "좋은습관, 나쁜습관, 이상한 습관", "body": "거울 들여다보기", "emotion": "희노애락", "living": "생활의 재발견", "secret": "말할 수 있는 비밀", "money": "머니 액츄얼리", "man and woman": "남과 여", "travel": "여행 또는 여행처럼", "childhood": "어린시절 자화상", "familly": "가족이라는 이름", "love": "달콤 씁쓸한 사랑", "friends": "친구? 친구~ 친구!", "future": "미리 그린 미래 그림", "decision": "그때는 틀리고 지금은 맞다", "happiness": "행복사고회로", "fear": "내 안에 숨어 있는 두려움", "death": "죽음이란 무엇인가" ]  // 낭만
