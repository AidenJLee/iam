//
//  AppFlowController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

enum FirstScene {
    case Login
    case Tutorial
    case Main
    case Category
}

final class AppFlowController: UIViewController, FlowControllerType {
    var showcase: FirstScene = .Main
    @IBOutlet weak var lbIntro: UILabel!
    override func viewDidLoad() {
        
        // warning: FlowController는 UI에 관여해서는 안된다.. 이 부분은 샘플로 임시 구현 부분. 향후 VC으로 변경하던가 사라질 예정
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment = NSTextAlignment.center
        
        let attributedString = NSMutableAttributedString(string: "‘I am’이\n자아를 만들고 있습니다.")
        attributedString.addAttribute(NSAttributedStringKey.font, value:UIFont(name:"ArialMT", size:32.0)!, range:NSMakeRange(0,6))
        attributedString.addAttribute(NSAttributedStringKey.font, value:UIFont(name:"AppleSDGothicNeo-Regular", size:19.0)!, range:NSMakeRange(6,1))
        attributedString.addAttribute(NSAttributedStringKey.font, value:UIFont(name:"AppleSDGothicNeo-Regular", size:19.0)!, range:NSMakeRange(8,3))
        attributedString.addAttribute(NSAttributedStringKey.font, value:UIFont(name:"AppleSDGothicNeo-Regular", size:19.0)!, range:NSMakeRange(12,3))
        attributedString.addAttribute(NSAttributedStringKey.font, value:UIFont(name:"AppleSDGothicNeo-Regular", size:19.0)!, range:NSMakeRange(16,5))
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:attributedStringParagraphStyle, range:NSMakeRange(0,21))
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value:UIColor(red:0.675, green:0.799, blue:0.791, alpha:1.0), range:NSMakeRange(0,6))
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value:UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0), range:NSMakeRange(6,14))
        self.lbIntro.attributedText = attributedString
        
        let time = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.perform(from: self)
        }
        
    }
    
    func perform(from viewController: UIViewController) {
        switch showcase {
        case .Login:
            showLogin()
        case .Tutorial:
            showTutorial()
        case .Main:
            showMain()
        case .Category:
            showMain()
        }
    }
    
    private func showLogin() {
        
    }
    
    private func showTutorial() {
        
    }
    
    private func showMain() {
        let vc = InstructionBookFlowController.initFromStoryboard(name: "Main")
        self.navigationController?.pushViewController(vc, animated: true)
    }

    private func showCategory() {
    
    }
    
}


