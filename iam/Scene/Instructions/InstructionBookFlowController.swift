//
//  InstructionBookFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

class InstructionBookFlowController: UIViewController, StoryboardInitializable, SegueHandler, FlowControllerType {
    func perform(from viewController: UIViewController) {
        
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierCase(for: segue) {
        case .embededInstructionBook:
            var nextVC = segue.destination as! InstructionBookViewController
            let viewModel = InstructionBookViewModel()
            nextVC.bindViewModel(to: viewModel)
        case .unnamed:
            assertionFailure("Segue identifier empty; all segues should have an identifier.")
        }
     }
}

extension InstructionBookFlowController {
    enum ViewControllerSegue: String {
        case embededInstructionBook
        case unnamed = ""
    }
}


