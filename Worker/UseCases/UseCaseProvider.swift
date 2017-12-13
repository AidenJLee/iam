//
//  UseCaseProvider.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 7..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RealmSwift

// MARK: - Implementation
public final class UseCaseProvider: Domain.UseCaseProvider {
    private let configuration: Realm.Configuration
    
    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }
    
    public func makeUseCaseUser() -> Domain.UseCaseUser {
        return UseCaseUser()
    }
    
    public func makeUseCaseCategory() -> Domain.UseCaseCategory {
        return UseCaseCategory()
    }
}
