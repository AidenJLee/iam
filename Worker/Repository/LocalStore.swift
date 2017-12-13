//
//  LocalStore.swift
//  Worker
//
//  Created by HoJun Lee on 2017. 12. 13..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import RxSwift
import RxRealm
import Realm
import RealmSwift

final class LocalStore<T:RealmRepresentable>: AbstractDataStore<T> where T == T.RealmType.DomainType, T.RealmType: Object {
    private var configuration: Realm.Configuration
    private let scheduler: SerialDispatchQueueScheduler = SerialDispatchQueueScheduler(qos: .default)
    
    private var realm: Realm {
        return try! Realm(configuration: self.configuration)
    }
    
    init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
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
    
    override func save(entity: T) -> Observable<Bool> {
        return Observable.deferred {
            return Observable.create { observer in
                do {
                    try self.realm.write {
                        self.realm.add(entity.asRealm(), update: true)
                    }
                    observer.onNext(true)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
                return Disposables.create()
            }
            }.subscribeOn(scheduler)
    }
    
    override func delete(entity: T) -> Observable<Bool> {
        return Observable.deferred {
            return Observable.create { observer in
                do {
                    try self.realm.write {
                        self.realm.delete(entity.asRealm())
                    }
                    observer.onNext(true)
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

class AbstractDataStore<T> {
    func queryAll() -> Observable<[T]> {
        abstractMethod()
    }
    
    func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
        abstractMethod()
    }
    
    func save(entity: T) -> Observable<Bool> {
        abstractMethod()
    }
    
    func delete(entity: T) -> Observable<Bool> {
        abstractMethod()
    }
}

func abstractMethod() -> Never {
    fatalError("abstract method")
}
