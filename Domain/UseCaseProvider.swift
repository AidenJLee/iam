//
//  UseCaseProvider.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

// MARK: - Interface
public protocol UseCaseProvider {
    func makeCategoryUseCase() -> CategoryUseCase
    //    func makeAnswersUseCase() -> AnswerUseCase
}
