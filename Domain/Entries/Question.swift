//
//  Question.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

// Category: ["real me": "안녕? 난 너야", "work": "직장생활백서", "habit": "좋은습관, 나쁜습관, 이상한 습관", "body": "거울 들여다보기", "emotion": "감정 들여다보기", "living": "생활의 재발견", "secret": "말할 수 있는 비밀", "money": "머니 액츄얼리", "man and woman": "남과 여", "travel": "여행 또는 여행처럼", "childhood": "어린시절의 자화상", "familly": "가족이라는 이름", "love": "사랑, 그 달콤 씁쓸한 이름", "friends": "반갑다 친구야", "future": "미리 그려보는 미래", "decision": "그때는 틀리고 지금은 맞다", "happiness": "행복사고회로", "fear": "내 안에 숨어 있는 두려움에 대하여", "death": "죽음이란 무엇인가" ]
import ObjectMapper

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

extension Question: ImmutableMappable {     // JSON -> Object
    public init(map: Map) throws {
        uid = try map.value("id")
        category = try map.value("category")
        question = try map.value("question")
        writer = try map.value("writer")
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
