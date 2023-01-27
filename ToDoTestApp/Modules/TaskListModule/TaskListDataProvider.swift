//
//  TaskListDataProvider.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import UIKit

enum Section: Int, CaseIterable {
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
        return Section.allCases.count
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reusedID, for: indexPath) as! TaskCell
        
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        guard let viewModel = viewModel else { fatalError() }
        
        let task: Task
        switch section {
        case .toDo: task = viewModel.task(at: indexPath.row)
        case .done: task = viewModel.doneTask(at: indexPath.row)
        }
    
        cell.configure(withTask: task)
        
        return cell
    }
}

