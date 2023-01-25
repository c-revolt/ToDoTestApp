//
//  TaskListViewModel.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import Foundation

final class TaskListViewModel {
    
    weak var view: TaskListViewControllerProtocol?
    weak var output: TaskListOutput?
    
    init(view: TaskListViewControllerProtocol? = nil, output: TaskListOutput? = nil) {
        self.view = view
        self.output = output
    }

}

extension TaskListViewModel: TaskListViewModelProtocol {
    
}
