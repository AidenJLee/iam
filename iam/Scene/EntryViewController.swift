//
//  EntryViewController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 23..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit

class ViewShake: UIView, Shakeable {
    // other customization here
}

class EntryViewController: UIViewController, StoryboardInitializable {
    @IBOutlet weak var lbCenter: UILabel!
    @IBOutlet weak var viewShake: ViewShake!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        let time = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: time) {
//            self.lbCenter.shake()
            self.viewShake.shake()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUp() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
        viewShake.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func circleMoved(_ recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: view)
        UIView.animate(withDuration: 0.1) {
            self.viewShake.center = location
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let sourceVC = segue.source
//        let destinationVC = segue.destination
    }

}
