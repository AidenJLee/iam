//
//  AnswerUseCase.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import RxSwift

public protocol AnswerUseCase {
    func answers(user: User) -> Observable<[Answer]>
    func save(answer: Answer) -> Observable<Void>
}
