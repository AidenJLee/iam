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
    let bag = DisposeBag()
    var viewModel: LoginViewModel!
    
    func bindViewModel() {
        assert(viewModel != nil)
        print("implement bind something")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
