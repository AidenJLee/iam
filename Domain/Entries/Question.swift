//
//  Question.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

public struct Question {
    public let uid: String
    public let category: String
    public let question: String
    public let writer: String
    
    public init(uid: String,
                category: String,
                question: String,
                writer: String) {
        self.uid = uid
        self.category = category
        self.question = question
        self.writer = writer
    }
}

extension Question: Equatable {
    public static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.category == rhs.category &&
            lhs.question == rhs.question &&
            lhs.writer == rhs.writer
    }
}
