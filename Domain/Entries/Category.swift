//
//  Category.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation

public struct IamCategory {
    public let uid: String
    public let name: String
    public let catchphrase: String
    public let aa: String
    
    public init(uid: String,
                name: String,
                catchphrase: String,
                aa: String) {
        self.uid = uid
        self.name = name
        self.catchphrase = catchphrase
        self.aa = aa
    }
}
