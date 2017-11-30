//
//  InstructionBookFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

class InstructionBookFlowController: UIViewController, StoryboardInitializable, SegueHandler {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierCase(for: segue) {
        case .embededInstructionBook:
            let nextVC = segue.destination as! InstructionBookViewController
            nextVC.setViewModel(InstructionBookViewModel())
        case .unnamed:
            assertionFailure("Segue identifier empty; all segues should have an identifier.")
        }
     }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
    }
    
}

extension InstructionBookFlowController {
    enum ViewControllerSegue: String {
        case embededInstructionBook
        case unnamed = ""
    }
}


