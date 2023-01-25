//
//  Coordinator.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 25.01.2023.
//

import UIKit

final class Coordinator {
    
    private let assembly: Assembly
    private var navigationController: UINavigationController?
    
    init(assembly: Assembly) {
        self.assembly = assembly
    }
    
    func start(window: UIWindow) {
        let taskListVC = assembly.makeTaskList(output: self)
        navigationController = UINavigationController(rootViewController: taskListVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: TaskListOutput
extension Coordinator: TaskListOutput {
    
}
