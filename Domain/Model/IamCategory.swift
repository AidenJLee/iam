//
//  ICategory.swift
//  Domain
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

public struct ICategory {
    public let id: String
    public let name: String
    public let depiction: String
    public let aa: String
    
    public init(id: String,
                name: String,
                depiction: String,
                aa: String) {
        self.id = id
        self.name = name
        self.depiction = depiction
        self.aa = aa
    }
}

extension ICategory: Equatable {
    public static func == (lhs: ICategory, rhs: ICategory) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.depiction == rhs.depiction &&
            lhs.aa == rhs.aa
    }
}
