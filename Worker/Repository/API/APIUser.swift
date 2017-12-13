//
//  APIUser.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 13..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

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
