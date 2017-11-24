//
//  AnswersNetwork.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift

public final class AnswerNetwork {
    private let network: Network<Answer>
    
    init(network: Network<Answer>) {
        self.network = network
    }
    
    public func getAnswers(user: User) -> Observable<[Answer]> {
        let ansoluteUrl = "Users/\(user.uid)/answers"
        return network.getItems(ansoluteUrl)
    }
    
    public func getAnswer(answerId: String) -> Observable<Answer> {
        return network.getItem("answers", itemId: answerId)
    }
    
    public func createAnswer(answer: Answer) -> Observable<Answer> {
        return network.postItem("answers", parameters: answer.toJSON())
    }
    
    public func deleteAnswer(postId: String) -> Observable<Answer> {
        return network.deleteItem("answers", itemId: postId)
    }
}
