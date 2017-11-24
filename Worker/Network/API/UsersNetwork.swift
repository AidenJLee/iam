//
//  UsersNetwork.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift

public final class UsersNetwork {
    private let network: Network<User>
    
    init(network: Network<User>) {
        self.network = network
    }
    
    public func getUsers() -> Observable<[User]> {
        return network.getItems("users")
    }
    
    public func getUser(userId: String) -> Observable<User> {
        return network.getItem("users", itemId: userId)
    }
}
