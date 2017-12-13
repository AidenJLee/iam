////
////  AnswersNetwork.swift
////  Worker
////
////  Created by HoJun Lee on 2017. 11. 23..
////  Copyright © 2017년 HoJun Lee. All rights reserved.
////
//
//import Domain
//import RxSwift
//
//enum APIAnswer: EndpointProtocol {
//    case Answers(userId: String)
//    case Answer(userId: String, answerId: String)
//
//    private var pathString: String {
//        get {
//            switch self {
//            case .Answers(let userId):
//                return String(format: "/users/%@/answers", userId)
//            case .Answer(let userId, let answerId):
//                return String(format: "/users/%@/answers/%@", userId, answerId)
//            }
//        }
//    }
//    var urlString: String {
//        get { return currentHost.urlString(path: self.pathString) }
//    }
//    var URL: NSURL? {
//        get { return NSURL(string: self.urlString) }
//    }
//}
//
//
//public final class AnswerNetwork {
//    private let network: Network<Answer>
//
//    init(network: Network<Answer>) {
//        self.network = network
//    }
//
//    public func getAnswers(userid: String) -> Observable<[Answer]> {
//        let absolutePath = APIAnswer.Answers(userId: userid).urlString
//        return network.getItems(absolutePath)
//    }
//
//    public func getAnswer(userid: String, answerid: String) -> Observable<Answer> {
//        let absolutePath = APIAnswer.Answer(userId: userid, answerId: answerid).urlString
//        return network.getItem(absolutePath)
//    }
//
////    public func createAnswer(answer: Answer) -> Observable<Answer> {
////        return network.postItem("answers", parameters: answer.toJSON())
////    }
////
////    public func deleteAnswer(postId: String) -> Observable<Answer> {
////        return network.deleteItem("answers", itemId: postId)
////    }
//}

