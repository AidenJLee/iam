//
//  UsersNetwork.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift

enum APIUser: EndpointProtocol {
    case Users
    case User(userId: String)
    
    private var pathString: String {
        get {
            switch self {
            case .Users:
                return "/users"
            case .User(let userId):
                return String(format: "/users/%@", userId)
            }
        }
    }
    var urlString: String {
        get { return currentHost.urlString(path: self.pathString) }
    }
    var URL: NSURL? {
        get { return NSURL(string: self.urlString) }
    }
}


public final class UsersNetwork {
    private let network: Network<User>
    
    init(network: Network<User>) {
        self.network = network
    }
    
    public func getUsers() -> Observable<[User]> {
        return network.getItems(APIUser.Users.urlString)
    }
    
    public func getUser(userId: String) -> Observable<User> {
        return network.getItem(APIUser.User(userId: userId).urlString)
    }
    
    public func creatUsers(parameters: [String: Any]) -> Observable<User> {
        return network.postItem(APIUser.Users.urlString, parameters: parameters)
    }
    
    public func updateUsers(userId: String, parameters: [String: Any]) -> Observable<User> {
        return network.updateItem(APIUser.User(userId: userId).urlString, parameters: parameters)
    }
    
    public func deleteUsers(userId: String, parameters: [String: Any]) -> Observable<User> {
        return network.deleteItem(APIUser.User(userId: userId).urlString)
    }
}
