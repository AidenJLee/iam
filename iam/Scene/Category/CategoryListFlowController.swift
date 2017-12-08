//
//  CategoryListFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain

class CategoryListFlowController: UIViewController, StoryboardInitializable, SegueHandler {
    weak var delegate: CategoryListFlowController?
    
    var viewModel: CategoryListViewModel!
    var containerVC: CategoryListViewController!
    private var categoryVC: CategoryListViewController? {
        didSet {
            categoryVC?.delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createViewModel() {
//        viewModel = CategoryListViewModel(useCase: Domain.UseCaseProvider().createCategoryUseCase(), flowController: self)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierCase(for: segue) {
        case .embededCategory:
            containerVC = segue.destination as! CategoryListViewController
            containerVC.viewModel = self.viewModel
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
}
