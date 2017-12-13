//
//  UseCaseUser.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 12. 13..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import RxSwift

public protocol UseCaseUser {
    func getUsers() -> Observable<[User]>
    func getUser(id: String) -> Observable<User>
    func createUsers(user: User) -> Observable<User>
    func updateUsers(id: String, user: User) -> Observable<User>
    func deleteUsers(id: String) -> Observable<User>
}
