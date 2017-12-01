//
//  CategoryListFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

class CategoryListFlowController: UIViewController, StoryboardInitializable, SegueHandler {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierCase(for: segue) {
        case .embededCategory:
            let nextVC = segue.destination as! CategoryListViewController
            nextVC.setViewModel(CategoryListViewModel())
        case .unnamed:
            assertionFailure("Segue identifier empty; all segues should have an identifier.")
        }
    }

}

extension CategoryListFlowController {
    enum ViewControllerSegue: String {
        case embededCategory
        case unnamed = ""
    }
}
