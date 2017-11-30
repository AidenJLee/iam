//
//  Coordinator.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

protocol CoordinatorProtocol: class {
    associatedtype T
    var currentViewController: UIViewController { get }
    @discardableResult
    func perform() -> Observable<T>
}

/// Base abstract coordinator generic over the return type of the `start` method.
class Coordinator<ResultType>: CoordinatorProtocol {
    
    typealias CoordinationResult = ResultType
    
    var currentViewController = UIViewController()
    
    let disposeBag = DisposeBag()
    private let identifier = String(describing: Coordinator.self)
    var childCoordinators = [String: Any]()
    private func store<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func free<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    /// 1. Stores coordinator in a dictionary of child coordinators.
    /// 2. Calls method `perform()` on that coordinator.
    /// 3. On the `onNext:` of returning observable of method `start()` removes coordinator from the dictionary.
    ///
    /// - Parameter coordinator: Coordinator to start.
    /// - Returns: Result of `start()` method.
    func coordinate<T>(to coordinator: Coordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.perform()
            .do(onNext: { [weak self] _ in print("destroy coordinator"); print(coordinator); self?.free(coordinator: coordinator) })
    }
    
    func perform() -> Observable<ResultType> {
        fatalError("perform method should be implemented.")
    }
}


