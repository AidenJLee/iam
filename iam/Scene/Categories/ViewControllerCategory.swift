//
//  ViewControllerCategory.swift
//  iam
//
//  Created by HoJun Lee on 2017. 11. 24..
//  Copyright © 2017년 HoJun Lee. All rights reserved.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

private let reuseIdentifier = "TableViewCellCategory"

class ViewControllerCategory: UIViewController, BindableType, StoryboardInitializable {
    let bag = DisposeBag()
    var viewModel: ViewModelCategory!
    let viewState = Variable(ViewState.Empty)
    
    @IBOutlet weak var tableView: UITableView!
    
    func bindViewModel() {
        assert(viewModel != nil)
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .map { _ in }
            .asObservable()
        let input = ViewModelCategory.Input(triger: viewWillAppear,
                                            selection: self.tableView.rx.itemSelected.asObservable())
        let output = self.viewModel.transformation(input: input)
        output.categories
            .drive(tableView.rx.items(cellIdentifier: reuseIdentifier,
                                      cellType: TableViewCellCategory.self)) { tableview, vm, cell in
                                        print(vm)
                                        cell.configuration(item: vm)
                                        cell.textLabel?.text = vm.name
            }.disposed(by: bag)
        
//            .bind(to: tableView.rx.items) { tableview, index, element in
//                let cell = tableview.dequeueReusableCell(withIdentifier: reuseIdentifier)
//                cell?.textLabel?.text = element.name
//                return cell!
//        }.disposed(by: bag)
        
        
        
        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext: { model in
                print("\(model) was selected")
            }).disposed(by: bag)
        
//        bind(to: tableView.rx.items) { (tableView, row, element) in
//            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)!
//            cell.textLabel?.text = "\(element.id) @ row \(row)"
//            return cell
//            }
//            .disposed(by: bag)
//        .bind(to: tableView.rx.items(dataSource: ))

//        let output = viewModel.OutputTransformer(input: input)
//        output.categories.asObservable()
//            .bind(to: tableView.rx.items(cellIdentifier: reuseIdentifier)) { index, model, cell in
//                cell.textLabel?.text = model
//            }
//            .disposed(by: bag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.register(TableViewCellCategory.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
}
