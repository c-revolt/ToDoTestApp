//
//  Assembly.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import UIKit

final class Assembly {
    
    func makeTaskList(output: TaskListOutput) -> UIViewController {
        let viewModel = TaskListViewModel(output: output)
        let view = TaskListViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
    
    func makeDetailTask(output: DetailTaskOutput) -> UIViewController {
        let viewModel = DetailTaskViewModel(output: output)
        let view = DetailTaskViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
}
