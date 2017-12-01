//
//  User+Mapping.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import ObjectMapper

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
