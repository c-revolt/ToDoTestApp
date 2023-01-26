//
//  TaskListDataProvider.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import UIKit

enum Section: Int {
    case toDo
    case done
}

class TaskListDataProvider: NSObject {
    var viewModel: TaskListViewModelProtocol!
}

extension TaskListDataProvider: UITableViewDelegate {
    
}

extension TaskListDataProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = Section(rawValue: section) else { fatalError() }
        guard let viewModel = viewModel else { return 0 }
        
        switch section {
        case .toDo: return viewModel.tasksCount
        case .done: return viewModel.doneTasksCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return TaskCell()
    }
    
    
}

