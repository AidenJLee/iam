//
//  UseCaseUser.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 13..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift
import Realm
import RealmSwift

final class UseCaseUser: Domain.UseCaseUser {    
    private let network = Network<User>()
    private let localStore = LocalStore<User>()
    
    public func getUsers() -> Observable<[User]> {
        return network.getItems(APIUser.Users.urlString)
    }
    
    public func getUser(id: String) -> Observable<User> {
        return network.getItem(APIUser.User(userId: id).urlString)
    }
    
    public func createUsers(user: User) -> Observable<User> {
        return network.postItem(APIUser.Users.urlString, parameters: user.toJSON())
    }
    
    public func updateUsers(id: String, user: User) -> Observable<User> {
        return network.updateItem(APIUser.User(userId: id).urlString, parameters: user.toJSON())
    }
    
    public func deleteUsers(id: String) -> Observable<User> {
        return network.deleteItem(APIUser.User(userId: id).urlString)
    }
}
