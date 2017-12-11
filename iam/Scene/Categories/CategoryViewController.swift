//
//  CategoryViewController.swift
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

class CategoryViewController: UIViewController, BindableType, StoryboardInitializable {
    let bag = DisposeBag()
    var viewModel: ViewModelCategory!
    let viewState = Variable(ViewState.Empty)
    
    @IBOutlet weak var tableView: UITableView!
    
    func bindViewModel() {
        assert(viewModel != nil)
//        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
//            .map { _ in }
//            .asDriver { error in return Driver.empty() }
//        let input = CategoryListViewModel.Input(title: <#SharedSequence<DriverSharingStrategy, String>#>, details: <#SharedSequence<DriverSharingStrategy, String>#>, trigger: viewWillAppear.asDriver(), selection: self.tableView!.rx.itemSelected.asDriver())
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
    
}
