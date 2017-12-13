//
//  EntityUser.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import Realm
import RealmSwift
import ObjectMapper

// Realm
final class RMUser: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var nickName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var name: String? = ""
    @objc dynamic var phone: String? = ""
    @objc dynamic var certificateUrl: String? = ""
    
    override static func primaryKey() -> String? { return "id" }
}

// Convertable
extension RMUser: DomainConvertableType {
    func asDomain() -> User {
        return User(id: id, nickName: nickName, email: email, name: name, phone: phone, certiUrl: certificateUrl)
    }
}

extension User: RealmRepresentable {
    internal var uid: String {
        return id
    }
    
    func asRealm() -> RMUser {
        return RMUser.build { object in
            object.id = id
            object.nickName = nickName
            object.email = email
            if let n = name { object.name = n }
            if let p = phone { object.phone = p }
            if let c = certificateUrl { object.certificateUrl = c }
        }
    }
}

// Domain Mapping
extension User: ImmutableMappable {     // JSON -> Object
    public init(map: Map) throws {
        id = try map.value("id")
        nickName = try map.value("nickName")
        email = try map.value("email")
        name = try map.value("name")
        phone = try map.value("phone")
        certificateUrl = try map.value("certificateUrl")
    }
}
