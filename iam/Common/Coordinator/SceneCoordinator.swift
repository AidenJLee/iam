////
////  SceneCoordinator.swift
////  iam
////
////  Created by HoJun Lee on 2017. 11. 28..
////  Copyright © 2017년 HoJun Lee. All rights reserved.
////
//
//import UIKit
//import RxSwift
//import RxCocoa
//
//enum Scene {
//    case rootScene()
//    case pushScene()
//}
//
//extension Scene {
//    func viewController(viewController: UIViewController) -> UIViewController {
//        switch self {
//        case .rootScene(let viewModel):
//            let nc = UINavigationController(rootViewController:viewController)
//            var vc = nc.viewControllers.first as! BindableType
////            vc.bindViewModel(to: viewModel)
//            return nc
//
//        case .pushScene(let viewModel):
////            viewController.bindViewModel(to: viewModel)
//            return viewController
//        }
//    }
//}
//
//enum SceneTransitionType {
//    case root
//    case push(animated: Bool)
//    case modal(animated: Bool)
//    
//    // Add custom transtion types...
//    case pushToVC(stackPath: [UIViewController], animated: Bool)
//}
//
//protocol CoordinatorType {
//    init(window: UIWindow)
//    var currentViewController: UIViewController { get }
//    @discardableResult
//    func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void>
//    
//    @discardableResult
//    func pop(animated: Bool) -> Observable<Void>
//    
//    @discardableResult
//    func popToRoot(animated: Bool) -> Observable<Void>
//    
//    @discardableResult
//    func popToVC(_ viewController: UIViewController, animated: Bool) -> Observable<Void>
//}
//
//final class SceneCoordinator: CoordinatorType {
//    
//    fileprivate var window: UIWindow
//    var currentViewController: UIViewController
//    
//    required init(window: UIWindow) {
//        self.window = window
//        currentViewController = window.rootViewController!
//    }
//    
//    static func actualViewController(for viewController: UIViewController) -> UIViewController {
//        if let navigationController = viewController as? UINavigationController {
//            return navigationController.viewControllers.first!
//        } else {
//            return viewController
//        }
//    }
//    
//    @discardableResult
//    func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void> {
//        let subject = PublishSubject<Void>()
//        let viewController = scene.viewController()
//        switch type {
//        case .root:
//            currentViewController = SceneCoordinator.actualViewController(for: viewController)
//            window.rootViewController = viewController
//            subject.onCompleted()
//            
//        case .push(let animated):
//            guard let navigationController = currentViewController.navigationController else {
//                fatalError("Can't push a view controller without a current navigation controller")
//            }
//            // one-off subscription to be notified when push complete
//            _ = navigationController.rx.delegate
//                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
//                .map { _ in }
//                .bind(to: subject)
//            navigationController.pushViewController(viewController, animated: animated)
//            currentViewController = SceneCoordinator.actualViewController(for: viewController)
//            
//        case .modal(let animated):
//            currentViewController.present(viewController, animated: animated) {
//                subject.onCompleted()
//            }
//            currentViewController = SceneCoordinator.actualViewController(for: viewController)
//            
//        case .pushToVC(let stack, let animated):
//            guard let navigationController = currentViewController.navigationController else {
//                fatalError("Can't push a view controller without a current navigation controller")
//            }
//            
//            var controllers = navigationController.viewControllers
//            stack.forEach { controllers.append($0) }
//            controllers.append(viewController)
//            
//            // one-off subscription to be notified when push complete
//            _ = navigationController.rx.delegate
//                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
//                .map { _ in }
//                .bind(to: subject)
//            navigationController.setViewControllers(controllers, animated: animated)
//            currentViewController = SceneCoordinator.actualViewController(for: viewController)
//            
//        default:
//            break
//        }
//        return subject.asObservable()
//            .take(1)
////            .ignoreElements()
//    }
//    
//    @discardableResult
//    func pop(animated: Bool) -> Observable<Void> {
//        let subject = PublishSubject<Void>()
//        if let presenter = currentViewController.presentingViewController {
//            // dismiss a modal controller
//            currentViewController.dismiss(animated: animated) {
//                self.currentViewController = SceneCoordinator.actualViewController(for: presenter)
//                subject.onCompleted()
//            }
//        } else if let navigationController = currentViewController.navigationController {
//            // navigate up the stack
//            // one-off subscription to be notified when pop complete
//            _ = navigationController.rx.delegate
//                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
//                .take(1) // To delete if already in return at bottom
//                .map { _ in }
//                .bind(to: subject)
//            
//            guard navigationController.popViewController(animated: animated) != nil else {
//                fatalError("can't navigate back from \(currentViewController)")
//            }
//            currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.last!)
//        } else {
//            fatalError("Not a modal, no navigation controller: can't navigate back from \(currentViewController)")
//        }
//        return subject.asObservable()
//            .take(1)
////            .ignoreElements()
//    }
//    
//    @discardableResult
//    func popToRoot(animated: Bool) -> Observable<Void> {
//        
//        let subject = PublishSubject<Void>()
//        
//        if let navigationController = currentViewController.navigationController {
//            // navigate up the stack
//            // one-off subscription to be notified when pop complete
//            _ = navigationController.rx.delegate
//                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
//                .take(1) // To delete if already in return at bottom
//                .map { _ in }
//                .bind(to: subject)
//            
//            guard navigationController.popToRootViewController(animated: animated) != nil else {
//                fatalError("can't navigate back to root VC from \(currentViewController)")
//            }
//            currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.first!)
//        }
//        
//        return subject.asObservable()
//            .take(1)
////            .ignoreElements()
//    }
//    
//    @discardableResult
//    func popToVC(_ viewController: UIViewController, animated: Bool) -> Observable<Void> {
//        
//        let subject = PublishSubject<Void>()
//        
//        if let navigationController = currentViewController.navigationController {
//            // navigate up the stack
//            // one-off subscription to be notified when pop complete
//            _ = navigationController.rx.delegate
//                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
//                .take(1) // To delete if already in return at bottom
//                .map { _ in }
//                .bind(to: subject)
//            
//            guard navigationController.popToViewController(viewController, animated: animated) != nil else {
//                fatalError("can't navigate back to VC from \(currentViewController)")
//            }
//            currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.last!)
//        }
//        return subject.asObservable()
//            .take(1)
////            .ignoreElements()
//    }
//}
//
//
//
