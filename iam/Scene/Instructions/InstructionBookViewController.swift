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
        viewModel.outputs.numberObservable
            .subscribe(onNext: { number in
                print(number)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        assertDependencies()    // Checking
        
        let time = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.viewModel.number.value = 10
        }
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
