//
//  TaskListViewController.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 24.01.2023.
//

import UIKit

final class TaskListViewController: UIViewController {

    private let viewModel: TaskListViewModelProtocol
    var tableView: UITableView!
    var dataProvider: TaskListDataProvider?
    
    // MARK: Lifecircle
    init(viewModel: TaskListViewModelProtocol!) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setupTableView() {
        tableView = UITableView()
        dataProvider = TaskListDataProvider()
        view.addSubview(tableView)
        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
        tableView.backgroundColor = .systemBackground
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.reusedID)
        
    }
    
    private func setupNavigationBar() {
        title = "Task List"
        
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .link
        navigationItem.rightBarButtonItem = barButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedRightBarButton() {
        viewModel.tappedRightBarButton()
    }
                                            
                                
}

extension TaskListViewController: TaskListViewControllerProtocol {
    
}

