//
//  EntityAnswer.swift
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
final class RMAnswer: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var userId: String = ""
    @objc dynamic var questionId: String = ""
    @objc dynamic var contents: String = ""
    
    override static func primaryKey() -> String? { return "id" }
}

// Convertable
extension RMAnswer: DomainConvertableType {
    func asDomain() -> Answer {
        return Answer(id: id, userId: userId, questionId: questionId, contents: contents)
    }
}

extension RMAnswer: RealmRepresentable {
    internal var uid: String {
        return id
    }
    
    func asRealm() -> RMAnswer {
        return RMAnswer.build { object in
            object.id = id
            object.userId = userId
            object.questionId = questionId
            object.contents = contents
        }
    }
}

// Domain Mapping
extension Answer: ImmutableMappable {      // JSON -> Object
    public init(map: Map) throws {
        id = try map.value("id")
        userId = try map.value("userId")
        questionId = try map.value("questionId")
        contents = try map.value("contents")
    }
}
