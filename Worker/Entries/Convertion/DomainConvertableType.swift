import Foundation

typealias DomainConvertableCoding = DomainConvertableType
protocol Encodable {
    associatedtype Encoder: DomainConvertableCoding
    var encoder: Encoder { get }
}

protocol DomainConvertableType {
    associatedtype DomainType
    func asDomain() -> DomainType
}


//protocol DomainConvertableType {
//    associatedtype DomainType: Identifiable
//    init(with domain: DomainType)
//    func asDomain() -> DomainType
//}
//
//protocol Identifiable {
//    var uid: String { get }
//}
