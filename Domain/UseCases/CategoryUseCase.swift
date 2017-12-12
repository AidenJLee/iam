//
//  CategoryUseCase.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import RxSwift

public protocol CategoryUseCase {
    func categories() -> Observable<[ICategory]>
    func save(item: ICategory) -> Observable<String>
}
