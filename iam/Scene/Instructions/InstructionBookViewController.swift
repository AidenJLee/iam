//
//  InstructionBookViewController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

class InstructionBookViewController: UIViewController, BindableType {
    let disposeBag = DisposeBag()
    var viewModel: InstructionBookViewModel!
    
    func setViewModel(_ model: InstructionBookViewModel!) {
        self.viewModel = model
    }
    
    func bindViewModel() {
        print("implement bind something")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()    // Checking
        bindViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension InstructionBookViewController {
    func assertDependencies() {
        assert(viewModel != nil)
    }
}
