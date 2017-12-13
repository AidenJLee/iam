//
//  SampleViewController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 12. 1..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

class SampleViewController: UIViewController, BindableType, StoryboardInitializable {
    enum Input {
    }
    enum Output {
        case saveAction
        case cancelAction
    }
    let bag = DisposeBag()
    var viewModel: SampleViewModel!
    @IBOutlet weak var lbIntro: UILabel!
    
    func bindViewModel() {
        assert(viewModel != nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("resources: \(RxSwift.Resources.total)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SampleViewController {
    func decorateLabel() {
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
    }
}
