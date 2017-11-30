//
//  QuestionsNetwork.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain
import RxSwift

public final class QuestionsNetwork {
    private let network: Network<Question>
    
    init(network: Network<Question>) {
        self.network = network
    }
    
    public func getQuestions() -> Observable<[Question]> {
        return network.getItems("question")
    }
    
//    public func getQuestion(questionId: String) -> Observable<Question> {
//        return network.getItem("question", itemId: questionId)
//    }
}
