//
//  FlowableType.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 11..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

protocol FlowableType {
    associatedtype Input
    associatedtype Output
    func transformation(input: Input) -> Output
}
