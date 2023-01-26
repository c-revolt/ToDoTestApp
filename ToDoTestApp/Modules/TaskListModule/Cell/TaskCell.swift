//
//  TaskCell.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 26.01.2023.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let reusedID = K.taskCellReusedID
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withTask task: Task) {
        
    }
}
