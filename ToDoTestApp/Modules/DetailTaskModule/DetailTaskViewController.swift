//
//  DetailTaskViewController.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 30.01.2023.
//

import UIKit

class DetailTaskViewController: UIViewController {
    
    private let viewModel: DetailTaskViewModelProtocol
    var tableView: UITableView!
    var detailTaskDataProvider: DetailTaskDataProvider?
    // MARK: Lifecircle
    init(viewModel: DetailTaskViewModelProtocol!) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        setupTableView()
    }
    
    deinit {
        print("Deinit Detail View")
    }
    
    func setupTableView() {
        tableView = UITableView()
        view.addSubview(tableView)
        detailTaskDataProvider = DetailTaskDataProvider()
        tableView.delegate = detailTaskDataProvider
        tableView.dataSource = detailTaskDataProvider
    }
}

extension DetailTaskViewController: DetailTaskViewControllerProtocol {
    
}
