//
//  Question+Mapping.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import ObjectMapper

extension Question: ImmutableMappable {     // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        category = try map.value("category")
        question = try map.value("question")
        writer = try map.value("writer")
    }
}
