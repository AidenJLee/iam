//
//  CategoryListFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Worker

class CategoryListFlowController: UIViewController, FlowControllerType {
    var viewModel: CategoryListViewModel!
    var containerVC: CategoryListViewController!
    
    func perform(from viewController: UIViewController) {
        let service = Worker.UseCaseProvider()
        viewModel = CategoryListViewModel(useCase:service.makeCategoryUseCase() , flowController: self)
        containerVC = CategoryListViewController.initFromStoryboard(name: .Main)
        containerVC.bindViewModel(to: viewModel)
        addChild(viewContoller: containerVC)
    }
    
    override func loadView() {
        super.loadView()
        perform(from: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segueIdentifierCase(for: segue) {
//        case .embededCategory:
//            containerVC = segue.destination as! CategoryListViewController
//            containerVC.bindViewModel(to: viewModel)
//        case .unnamed:
//            assertionFailure("Segue identifier empty; all segues should have an identifier.")
//        }
//    }
}

//extension CategoryListFlowController {
//    // Segue
//    enum ViewControllerSegue: String {
//        case embededCategory
//        case unnamed = ""
//    }
//}

