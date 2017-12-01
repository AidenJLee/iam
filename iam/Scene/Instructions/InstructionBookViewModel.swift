//
//  InstructionBookViewModel.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 30..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

final class InstructionBookViewModel: ViewModelInput, ViewModelOutput, ViewModelTypeProtocol {
    var number = Variable<Int>(100)
    var numberObservable: Observable<Int>
    
    var inputs: ViewModelInput { return self }
    var outputs: ViewModelOutput { return self }
    
    init() {
        self.numberObservable = number.asObservable()
    }
    
}

extension InstructionBookViewModel {
    func request1() {
        
    }
    func request2() {
        
    }
    func request3() {
        
    }
}

protocol ViewModelInput {
    func request1()
    func request2()
    func request3()
}

protocol ViewModelOutput {
    var numberObservable: Observable<Int> { get }
}

protocol ViewModelTypeProtocol {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}
