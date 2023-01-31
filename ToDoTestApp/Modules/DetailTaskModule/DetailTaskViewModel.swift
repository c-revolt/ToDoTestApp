//
//  DetailTaskViewModel.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 30.01.2023.
//

import UIKit

final class DetailTaskViewModel {
    
    weak var view: DetailTaskViewControllerProtocol?
    weak var output: DetailTaskOutput?
    
    init(view: DetailTaskViewControllerProtocol? = nil, output: DetailTaskOutput? = nil) {
        self.view = view
        self.output = output
    }
    
    deinit {
        print("Deinit Detail View Model")
    }
}

extension DetailTaskViewModel: DetailTaskViewModelProtocol {
    
}
