//
//  SampleFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

class SampleFlowController: UIViewController, StoryboardInitializable, SegueHandler {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierCase(for: segue) {
        case .embededSample:
            var nextVC = segue.destination as! SampleViewController
            nextVC.bindViewModel(to: SampleViewModel())
        case .unnamed:
            assertionFailure("Segue identifier empty; all segues should have an identifier.")
        }
    }
}

extension SampleFlowController {
    enum ViewControllerSegue: String {
        case embededSample
        case unnamed = ""
    }
}
