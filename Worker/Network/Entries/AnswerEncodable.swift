//
//  AnswerEncodable.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import ObjectMapper

extension Answer: Encodable, Identifiable {
    var encoder: NETAnswer {
        return NETAnswer(with: self)
    }
}

final class NETAnswer: NSObject, NSCoding, DomainConvertibleType {
    struct Keys {
        static let uid = "uid"
        static let userId = "userId"
        static let questionId = "questionId"
        static let answer = "answer"
    }
    let uid: String
    let userId: String
    let questionId: String
    let answer: String
    
    init(with domain: Answer) {
        self.uid = domain.uid
        self.userId = domain.userId
        self.questionId = domain.questionId
        self.answer = domain.answer
    }
    
    init?(coder aDecoder: NSCoder) {
        guard
            let uid = aDecoder.decodeObject(forKey: Keys.uid) as? String,
            let userId = aDecoder.decodeObject(forKey: Keys.userId) as? String,
            let questionId = aDecoder.decodeObject(forKey: Keys.questionId) as? String,
            let answer = aDecoder.decodeObject(forKey: Keys.answer) as? String
            else {
                return nil
        }
        self.uid = uid
        self.userId = userId
        self.questionId = questionId
        self.answer = answer
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Keys.uid)
        aCoder.encode(userId, forKey: Keys.userId)
        aCoder.encode(questionId, forKey: Keys.questionId)
        aCoder.encode(answer, forKey: Keys.answer)
    }
    
    func asDomain() -> Answer {
        return Answer(uid: uid,
                      userId: userId,
                      questionId: questionId,
                      answer: answer)
    }
}

