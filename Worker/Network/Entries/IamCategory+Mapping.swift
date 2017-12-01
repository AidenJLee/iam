//
//  IamCategory+Mapping.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import ObjectMapper

extension IamCategory: ImmutableMappable {      // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        name = try map.value("name")
        description = try map.value("description")
        aa = try map.value("aa")
    }
}
