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
    let viewState = Variable(ViewState.Empty)
    
    var viewModel: InstructionBookViewModel!
    
    func setViewModel(_ model: InstructionBookViewModel!) {
        self.viewModel = model
    }
    
    func bindViewModel() {
        print("implement bind something")
//        viewModel.inOutTransform(input: InstructionBookViewModel.Input)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()    // Checking
//        viewModel.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension InstructionBookViewController {
    func assertDependencies() {
//        assert(viewModel != nil)
//        fatalError("assertDependencies method should be implemented.")
    }
}
