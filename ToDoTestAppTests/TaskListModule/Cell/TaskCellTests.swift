//
//  TaskCellTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 29.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class TaskCellTests: XCTestCase {


    var viewModel: TaskListViewModel!
    var view: TaskListViewController!
    var cell: TaskCell!
    
    override func setUpWithError() throws {
        viewModel = TaskListViewModel()
        view = TaskListViewController(viewModel: viewModel)
        view.loadViewIfNeeded()
        let tableView = view.tableView
        let dataSorce = FakeDataSource()
        tableView?.dataSource = dataSorce
        
        cell = tableView?.dequeueReusableCell(withIdentifier: TaskCell.reusedID, for: IndexPath(row: 0, section: 0)) as? TaskCell
    }

    override func tearDownWithError() throws {
       
    }

    func testCellHasTitleLabel() {
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func testCellHasTitleLabelInContentView() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func configureCellWithTask() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task, done: true)
    }
    
    func testConfigureSetsLocationName() {
        let location = Location(name: "Foo")
        let task = Task(title: "Bar", location: location)
        
        cell.configure(withTask: task)
        
        XCTAssertEqual(cell.locationLabel.text, task.location?.name)
    }
    
    func testConfigureSetsDate() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task)
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateString = df.string(from: date!)
        
        XCTAssertEqual(cell.dateLabel.text, dateString)
    }
    
    func testDoneTaskShouldStrikeThrough() {
        configureCellWithTask()
        
        let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
        
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
    }
    
    func testDoneTaskDateLabelEqualsNil() {
        configureCellWithTask()
        XCTAssertNil(cell.dateLabel)
    }
    
    func testDoneTaskLocationLabelEqualsNil() {
        configureCellWithTask()
        XCTAssertNil(cell.locationLabel)
    }
}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
