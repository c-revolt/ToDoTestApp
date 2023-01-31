//
//  DetailTaskDataProvider.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 31.01.2023.
//

import UIKit

enum DetailSection: Int, CaseIterable {
    case title
    case description
    case date
    case location
    case save
}

class DetailTaskDataProvider: NSObject {
    var viewModel: DetailTaskViewModelProtocol!
}

extension DetailTaskDataProvider: UITableViewDelegate {
    
}

extension DetailTaskDataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
