//
//  User.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

public struct User {
    public let id: String
    public let nickName: String
    public let email: String
    public let name: String?
    public let phone: String?
    public let certificateUrl: String?
    
    public init(id: String,
                nickName: String,
                email: String,
                name: String?,
                phone: String?,
                certiUrl: String?) {
        self.id = id
        self.nickName = nickName
        self.email = email
        self.name = name
        self.phone = phone
        self.certificateUrl = certiUrl
    }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
            lhs.nickName == rhs.nickName &&
            lhs.email == rhs.email &&
            lhs.name == rhs.name &&
            lhs.phone == rhs.phone &&
            lhs.certificateUrl == rhs.certificateUrl
    }
}
