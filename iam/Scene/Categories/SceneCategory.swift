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
import RxCocoa

class SceneCategory: UIViewController, SceneType {
    struct Input {
        let selecTriger: Observable<IndexPath>
    }
    struct Output {
        let saved: Observable<Bool>
    }
    
    var viewModel: ViewModelCategory!
    var containerVC: ViewControllerCategory!
    
    var showCase: SceneCategory.Scene!
    
    func sceneSwitch(scene: SceneCategory.Scene) {
        
    }
    
    func perform(from viewController: UIViewController) {
        let service = Worker.UseCaseProvider()
        viewModel = ViewModelCategory(useCase:service.makeUseCaseCategory())
        containerVC = ViewControllerCategory.initFromStoryboard(name: .Main)
        containerVC.bindViewModel(to: viewModel)
        addChild(viewContoller: containerVC)
    }
    
    override func loadView() {
        super.loadView()
        sceneSwitch(scene: .Dateil)
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
