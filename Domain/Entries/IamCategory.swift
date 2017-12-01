//
//  IamCategory.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

public struct IamCategory {
    public let uid: String
    public let name: String
    public let description: String
    public let aa: String
    
    public init(uid: String,
                name: String,
                description: String,
                aa: String) {
        self.uid = uid
        self.name = name
        self.description = description
        self.aa = aa
    }
}
