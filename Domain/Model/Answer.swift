//
//  Answer.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

public struct Answer {
    public let id: String
    public let userId: String
    public let questionId: String
    public let contents: String
    
    public init(id: String, userId: String, questionId: String, contents: String) {
        self.id = id
        self.userId = userId
        self.questionId = questionId
        self.contents = contents
    }
}

extension Answer: Equatable {
    public static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.questionId == rhs.questionId &&
            lhs.contents == rhs.contents
    }
}

// 적용 할까 말까...
enum AnswerType {
    case free
    case choices
    case grade
}
