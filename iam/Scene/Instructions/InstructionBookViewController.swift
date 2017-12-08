//
//  InstructionBookViewController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 29..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import RxSwift

class InstructionBookViewController: UIViewController, BindableType, UITableViewDelegate, UITableViewDataSource {
    let bag = DisposeBag()
    var viewModel: InstructionBookViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
