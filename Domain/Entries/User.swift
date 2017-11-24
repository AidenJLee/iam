//
//  User.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import ObjectMapper

public struct User {
    public let uid: String
    public let nickName: String
    public let email: String
    public let name: String?
    public let phone: String?
    public let certificateUrl: String?
    
    public init(uid: String,
                nickName: String,
                email: String,
                name: String?,
                phone: String?,
                certiUrl: String?) {
        self.uid = uid
        self.nickName = nickName
        self.email = email
        self.name = name
        self.phone = phone
        self.certificateUrl = certiUrl
    }
}

extension User: ImmutableMappable {     // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        nickName = try map.value("nickName")
        email = try map.value("email")
        name = try map.value("name")
        phone = try map.value("phone")
        certificateUrl = try map.value("certificateUrl")
    }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.uid == rhs.uid &&
            lhs.nickName == rhs.nickName &&
            lhs.email == rhs.email &&
            lhs.name == rhs.name &&
            lhs.phone == rhs.phone &&
            lhs.certificateUrl == rhs.certificateUrl
    }
}
