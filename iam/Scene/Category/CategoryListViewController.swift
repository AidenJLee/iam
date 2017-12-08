//
//  CategoryListViewController.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

private let reuseIdentifier = "CellCategory"

class CategoryListViewController: UIViewController, BindableType {
    weak var delegate: CategoryListFlowController?
    let viewState = Variable(ViewState.Empty)
    
    let bag = DisposeBag()
    var viewModel: CategoryListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    func bindViewModel() {
        assert(viewModel != nil)
//        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
//            .map { _ in }
//            .asDriver { error in return Driver.empty() }
//        let input = CategoryListViewModel.Input(trigger: viewWillAppear.asDriver(), selection: self.tableView!.rx.itemSelected.asDriver())
//        let output = viewModel.OutputTransformer(input: input)
//        output.categories.asObservable()
//            .bind(to: tableView.rx.items(cellIdentifier: reuseIdentifier)) { index, model, cell in
//                cell.textLabel?.text = model
//            }
//            .disposed(by: bag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CategoryListViewController {
    func assertDependencies() {
        assert(viewModel != nil)
    }
}
