//
//  Environment.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

protocol EndpointProtocol {
    var urlString: String { get }
    var URL: NSURL? { get }
}

// 통신상태를 Enum로 표현
enum RequestState  {
    case None
    case Requesting
    case Done
    case Error
}

enum ServiceHost: String {
    case Development = "http://localhost:8080/iam"
    case Product = "http://api.entist.com/iam"
    
    var baseURL: NSURL {
        return NSURL(string: self.rawValue)!
    }
    
    func urlString(path: String) -> String {
        return self.baseURL.absoluteString! + "\(path)"
    }
}

let currentHost: ServiceHost = ServiceHost.Product
