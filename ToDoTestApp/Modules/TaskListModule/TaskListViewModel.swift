//
//  TaskListViewModel.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import Foundation

final class TaskListViewModel {
    
    // properties
    weak var view: TaskListViewControllerProtocol?
    weak var output: TaskListOutput?
    
    var tasksCount: Int {
        return tasks.count
    }

    var doneTasksCount: Int {
        return doneTasks.count
    }

    var tasks: [Task] = []
    var doneTasks: [Task] = []
    
    init(view: TaskListViewControllerProtocol? = nil, output: TaskListOutput? = nil) {
        self.view = view
        self.output = output
    }
}

extension TaskListViewModel: TaskListViewModelProtocol {
    
    
    
    func add(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }

    func task(at index: Int) -> Task {
        return tasks[index]
    }

    func checkTask(at index: Int) {
        let task = tasks.remove(at: index)
        doneTasks.append(task)
    }

    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }

    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}


