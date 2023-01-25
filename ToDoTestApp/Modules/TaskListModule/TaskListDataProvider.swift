//
//  TaskListDataProvider.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import UIKit

class TaskListDataProvider: NSObject {
    var taskViewModel: TaskListViewModelProtocol!
}

extension TaskListDataProvider: UITableViewDelegate {
    
}

extension TaskListDataProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskViewModel.tasksCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

