//
//  UseCaseProvider.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import Domain
import Realm
import RealmSwift

public final class UseCaseProvier: Domain.UseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func creatAnswersUseCase() -> Domain.AnswerUseCase {
        return AnswerUseCase(network: networkProvider.creatAnswerNetwork(), cache: Cache<Answer>(path: "allAnswer"))
    }
}
