//
//  UseCaseProvider.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 7..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import Domain
import Realm
import RealmSwift

// MARK: - Implementation
public final class UseCaseProvider: Domain.UseCaseProvider {
    private let networkProvider: NetworkProvider
    private let configuration: Realm.Configuration
    
    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        networkProvider = NetworkProvider()
        self.configuration = configuration
    }
    
    public func makeCategoryUseCase() -> Domain.CategoryUseCase {
        let repository = Repository<ICategory>(configuration: configuration)
        return CategoryUseCase(repository: repository)
    }
}
