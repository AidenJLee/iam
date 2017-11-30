////
////  AnswerUseCase.swift
////  Worker
////
////  Created by HoJun Lee on 2017. 11. 23..
////  Copyright © 2017년 HoJun Lee. All rights reserved.
////
//
//import Foundation
//import Domain
//import RxSwift
//
//final class AnswerUseCase: Domain.AnswerUseCase {
//    private let network: AnswerNetwork
//    private let cache: AbstractCache<Answer>
//    
//    init(network: AnswerNetwork, cache: AbstractCache<Answer>) {
//        self.network = network
//        self.cache = cache
//    }
//    
//    func answers(user: User) -> Observable<[Answer]> {
//        let fetchAnswers = cache.fetchObjects().asObservable()
//        let stored = network.getAnswers(userid: String)
//            .flatMap {
//                return self.cache.save(objects: $0)
//                    .asObservable()
//                    .map(to: [Answer].self)
//                    .concat(Observable.just($0))
//        }
//        
//        return fetchAnswers.concat(stored)
//    }
//    
//    func save(answer: Answer) -> Observable<Void> {
//        return network.getAnswers(userid: String)
//            .map { _ in }
//    }
//}
//
//struct MapFromNever: Error {}
//extension ObservableType where E == Never {
//    func map<T>(to: T.Type) -> Observable<T> {
//        return self.flatMap { _ in
//            return Observable<T>.error(MapFromNever())
//        }
//    }
//}

