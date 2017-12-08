import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

class AbstractRepository<T> {
    func queryAll() -> Observable<[T]> {
        abstractMethod()
    }
    
    func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
        abstractMethod()
    }
    
    func save(entity: T) -> Observable<String> {
        abstractMethod()
    }
    
    func delete(entity: T) -> Observable<String> {
        abstractMethod()
    }
}

func abstractMethod() -> Never {
    fatalError("abstract method")
}

final class Repository<T:RealmRepresentable>: AbstractRepository<T> where T == T.RealmType.DomainType, T.RealmType: Object {
    private let configuration: Realm.Configuration
    private let scheduler: SerialDispatchQueueScheduler
    
    private var realm: Realm {
        return try! Realm(configuration: self.configuration)
    }
    
    init(configuration: Realm.Configuration) {
        self.configuration = configuration
        self.scheduler = SerialDispatchQueueScheduler(qos: .default)
        print("File 📁 url: \(RLMRealmPathForFile("default.realm"))")
    }
    
    override func queryAll() -> Observable<[T]> {
        return Observable.deferred {
            let objects = self.realm.objects(T.RealmType.self)
            return Observable.array(from: objects)
                .mapToDomain()
            }
            .subscribeOn(scheduler)
    }
    
    override func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(T.RealmType.self)
                .filter(predicate)
                .sorted(by: sortDescriptors.map(SortDescriptor.init))
            return Observable.array(from: objects).mapToDomain()
            }
            .subscribeOn(scheduler)
    }
    
    override func save(entity: T) -> Observable<String> {
        return Observable.deferred {
            return Observable.create { observer in
                do {
                    try self.realm.write {
                        self.realm.add(entity.asRealm(), update: true)
                    }
                    observer.onNext("save")
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
                return Disposables.create()
            }
            }.subscribeOn(scheduler)
    }
    
    override func delete(entity: T) -> Observable<String> {
        return Observable.deferred {
            return Observable.create { observer in
                do {
                    try self.realm.write {
                        self.realm.delete(entity.asRealm())
                    }
                    observer.onNext("delete")
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
                return Disposables.create()
            }
            }
            .subscribeOn(scheduler)
    }
    
}

