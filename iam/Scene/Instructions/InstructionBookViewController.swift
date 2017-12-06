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
    let bag = DisposeBag()
    var viewModel: InstructionBookViewModel!
    
    @IBOutlet weak var tfTransfromTest: UITextField!
    let convert: (String) -> UInt? = { value in
        if let number = UInt(value), number < 10 {
            return number
        }
        let convert: [String: UInt] = [
            "abc": 2, "def": 3, "ghi": 4,
            "jkl": 5, "mno": 6, "pqrs": 7,
            "tuv": 8, "wxyz": 9
        ]
        var converted: UInt? = nil
        
        convert.keys.forEach {
            if $0.contains(value.lowercased()) {
                converted = convert[$0]
            }
        }
        return converted
    }
    
    func bindViewModel() {
        assert(viewModel != nil)
        print("implement bind something")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
