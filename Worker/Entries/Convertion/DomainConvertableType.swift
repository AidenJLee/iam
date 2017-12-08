//
//  DomainConvertableType.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 7..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

typealias DomainConvertibleCoding = DomainConvertableType
protocol Encodable {
    associatedtype Encoder: DomainConvertibleCoding
    var encoder: Encoder { get }
}

protocol DomainConvertableType {
    associatedtype DomainType
    func asDomain() -> DomainType
}


//protocol DomainConvertableType {
//    associatedtype DomainType: Identifiable
//    init(with domain: DomainType)
//    func asDomain() -> DomainType
//}
//
//protocol Identifiable {
//    var uid: String { get }
//}
