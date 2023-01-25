//
//  TaskListProtocols.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import UIKit

protocol TaskListViewControllerProtocol: AnyObject {
    
}

protocol TaskListViewModelProtocol: AnyObject {
    var doneTasksCount: Int { get }
    var tasksCount: Int { get }
    var tasks: [Task] { get }
    var doneTasks: [Task] { get }
    init(view: TaskListViewControllerProtocol?, output: TaskListOutput?)
    func add(task: Task)
    func task(at index: Int) -> Task
    func checkTask(at index: Int)
    func doneTask(at index: Int) -> Task
    func removeAll()
}
