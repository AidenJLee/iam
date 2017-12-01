//
//  CategoryListFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain

class CategoryListFlowController: UIViewController, StoryboardInitializable, SegueHandler, BindableType {
    var viewModel: CategoryListViewModel!
    
    func setViewModel(_ model: CategoryListViewModel!) {
        self.viewModel = model
    }
    
    func bindViewModel() {
        print("implement bind something")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel = CategoryListViewModel(useCase: UseCaseProvider, flowController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierCase(for: segue) {
        case .embededCategory:
            let nextVC = segue.destination as! CategoryListViewController
            nextVC.viewModel = self.viewModel
        case .unnamed:
            assertionFailure("Segue identifier empty; all segues should have an identifier.")
        }
    }
}

extension CategoryListFlowController {
    // Segue
    enum ViewControllerSegue: String {
        case embededCategory
        case unnamed = ""
    }
    // checking
    func assertDependencies() {
        //        assert(viewModel != nil)
        //        fatalError("assertDependencies method should be implemented.")
    }
}

extension CategoryListViewController {
    
}
