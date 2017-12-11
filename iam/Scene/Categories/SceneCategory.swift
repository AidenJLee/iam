//
//  SceneCategory.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Worker
import RxSwift

class SceneCategory: UIViewController, SceneType {
    struct Input {
        let saveTrigger: Observable<Void>
    }
    struct Output {
        let saved: Observable<Bool>
    }
    
    var viewModel: ViewModelCategory!
    var containerVC: CategoryViewController!
    
    var showCase: SceneCategory.Scene!
    
    func sceneSwitch(scene: SceneCategory.Scene) {
        let service = Worker.UseCaseProvider()
        viewModel = ViewModelCategory(useCase:service.makeCategoryUseCase())
        containerVC = CategoryViewController.initFromStoryboard(name: .Main)
        containerVC.bindViewModel(to: viewModel)
        //        addChild(viewContoller: containerVC)
    }
    
    func perform(from viewController: UIViewController) {
        
    }
    
    override func loadView() {
        super.loadView()
        perform(from: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SceneCategory {
    enum Scene {
        case Dateil
        case Edit
    }
}
