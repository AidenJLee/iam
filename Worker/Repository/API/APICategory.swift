//
//  APICategory.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 13..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

enum APICategory: EndpointProtocol {
    case Categories
    case Category(id: String)
    
    private var pathString: String {
        get {
            switch self {
            case .Categories:
                return "/Categories"
            case .Category(let id):
                return String(format: "/Category/%@", id)
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
