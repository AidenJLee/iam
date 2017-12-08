//
//  RealmRepresentableType.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 7..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: DomainConvertableType
    var uid: String {get}
    func asRealm() -> RealmType
}
