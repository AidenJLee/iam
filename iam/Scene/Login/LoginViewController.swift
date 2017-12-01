//
//  LoginViewController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController, BindableType {
    let disposeBag = DisposeBag()
    var viewModel: LoginViewModel!
    
    func setViewModel(_ model: LoginViewModel!) {
        self.viewModel = model
    }
    
    func bindViewModel() {
        print("implement bind something")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LoginViewController {
    func assertDependencies() {
        assert(viewModel != nil)
    }
}
