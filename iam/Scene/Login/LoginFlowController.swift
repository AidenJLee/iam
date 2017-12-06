//
//  LoginFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

class LoginFlowController: UIViewController, StoryboardInitializable, SegueHandler {

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
        case .embededLogin:
            var nextVC = segue.destination as! LoginViewController
            nextVC.bindViewModel(to: LoginViewModel())
        case .unnamed:
            assertionFailure("Segue identifier empty; all segues should have an identifier.")
        }
    }
}

extension LoginFlowController {
    enum ViewControllerSegue: String {
        case embededLogin
        case unnamed = ""
    }
}
