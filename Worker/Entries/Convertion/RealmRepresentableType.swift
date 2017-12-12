import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: DomainConvertableType
    var id: String {get}
    func asRealm() -> RealmType
}
