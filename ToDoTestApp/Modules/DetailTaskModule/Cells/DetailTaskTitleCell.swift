//
//  DetailTaskTitleCell.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 30.01.2023.
//

import UIKit

final class DetailTaskTitleCellViewModel {
    let title: String?
    private(set) var subtitle: String?
    let placeholder: String?
    
    init(title: String? = nil, subtitle: String? = nil, placeholder: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}

class DetailTaskTitleCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let titleTextField = UITextField()
}
