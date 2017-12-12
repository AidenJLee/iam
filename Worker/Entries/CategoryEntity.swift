//
//  CategoryEntity.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 8..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import Foundation
import Domain
import Realm
import RealmSwift
import ObjectMapper

// Realm
final class RMCategory: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var depiction: String = ""
    @objc dynamic var aa: String = ""
    
    override static func primaryKey() -> String? { return "id" }
}

// Convertable
extension RMCategory: DomainConvertableType {
    func asDomain() -> ICategory {
        return ICategory(id: id, name: name, depiction: depiction, aa: aa)
    }
}

extension ICategory: RealmRepresentable {
    internal var uid: String {
        return id
    }
    
    func asRealm() -> RMCategory {
        return RMCategory.build { object in
            object.id = id
            object.name = name
            object.depiction = depiction
            object.aa = aa
        }
    }
}

// Mapping
extension ICategory: ImmutableMappable {      // JSON -> Object
    public init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        depiction = try map.value("description")
        aa = try map.value("aa")
    }
}
