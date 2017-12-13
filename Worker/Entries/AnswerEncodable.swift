//
//  AnswerEncodable.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import ObjectMapper

extension Answer: Encodable {//}, Identifiable {
    var encoder: NETAnswer {
        return NETAnswer(with: self)
    }
}

final class NETAnswer: NSObject, NSCoding, DomainConvertableType {
    struct Keys {
        static let id = "id"
        static let userId = "userId"
        static let questionId = "questionId"
        static let contents = "contents"
    }
    let id: String
    let userId: String
    let questionId: String
    let contents: String
    
    init(with domain: Answer) {
        self.id = domain.id
        self.userId = domain.userId
        self.questionId = domain.questionId
        self.contents = domain.contents
    }
    
    init?(coder aDecoder: NSCoder) {
        guard
            let id = aDecoder.decodeObject(forKey: Keys.id) as? String,
            let userId = aDecoder.decodeObject(forKey: Keys.userId) as? String,
            let questionId = aDecoder.decodeObject(forKey: Keys.questionId) as? String,
            let contents = aDecoder.decodeObject(forKey: Keys.contents) as? String
            else {
                return nil
        }
        self.id = id
        self.userId = userId
        self.questionId = questionId
        self.contents = contents
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: Keys.id)
        aCoder.encode(userId, forKey: Keys.userId)
        aCoder.encode(questionId, forKey: Keys.questionId)
        aCoder.encode(contents, forKey: Keys.contents)
    }
    
    func asDomain() -> Answer {
        return Answer(id: id,
                      userId: userId,
                      questionId: questionId,
                      contents: contents)
    }
}

