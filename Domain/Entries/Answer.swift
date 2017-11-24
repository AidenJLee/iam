//
//  Answer.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import ObjectMapper

enum AnswerType {
    case free
    case choices
    case grade
}

public struct Answer {
    public let uid: String
    public let userId: String
    public let questionId: String
    public let answer: String
    
    public init(uid: String, userId: String, questionId: String, answer: String) {
        self.uid = uid
        self.userId = userId
        self.questionId = questionId
        self.answer = answer
    }
}

extension Answer: ImmutableMappable {      // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        userId = try map.value("userId")
        questionId = try map.value("questionId")
        answer = try map.value("answer")
    }
}

extension Answer: Equatable {
    public static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.userId == rhs.userId &&
            lhs.questionId == rhs.questionId &&
            lhs.answer == rhs.answer
    }
}

