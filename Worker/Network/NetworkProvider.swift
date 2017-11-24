//
//  NetworkProvider.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Domain

final class NetworkProvider {
    private let apiEndpoint: String
    
    public init() {
        apiEndpoint = "https://jsonplaceholder.typicode.com"
    }
    
    public func creatUserNetwork() -> UsersNetwork {
        let network = Network<User>(apiEndpoint)
        return UsersNetwork(network: network)
    }
    
    public func creatQuestionNetwork() -> QuestionsNetwork {
        let network = Network<Question>(apiEndpoint)
        return QuestionsNetwork(network: network)
    }
    
    public func creatAnswerNetwork() -> AnswerNetwork {
        let network = Network<Answer>(apiEndpoint)
        return AnswerNetwork(network: network)
    }
}
