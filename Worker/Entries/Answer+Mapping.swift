//
//  Answer+Mapping.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import ObjectMapper

extension Answer: ImmutableMappable {      // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        userId = try map.value("userId")
        questionId = try map.value("questionId")
        answer = try map.value("answer")
    }
}
