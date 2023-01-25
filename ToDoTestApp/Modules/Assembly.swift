//
//  Assembly.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import Foundation

final class Assembly {
    
    func makeTaskList(output: TaskListOutput) -> TaskListViewController {
        let viewModel = TaskListViewModel(output: output)
        let view = TaskListViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
}
