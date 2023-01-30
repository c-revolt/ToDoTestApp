//
//  TaskCell.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 26.01.2023.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let reusedID = K.taskCellReusedID
    
    private var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }()
    
    var titleLabel: UILabel!
    var locationLabel: UILabel!
    var dateLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel()
        locationLabel = UILabel()
        dateLabel = UILabel()
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(dateLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title ?? "", attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            titleLabel.attributedText = attributedString
            dateLabel = nil
            locationLabel = nil
            
        } else {
            self.titleLabel.text = task.title
            self.locationLabel.text = task.location?.name
            
            if let date = task.date {
                let dateString = dateFormatter.string(from: date)
                dateLabel.text = dateString
            }
        
        }
    }
    
}
