//
//  TaskListDataProviderTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 25.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class TaskListDataProviderTests: XCTestCase {

    var sut: TaskListDataProvider!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        sut = TaskListDataProvider()
        tableView = UITableView()
        tableView.dataSource = sut
        sut.taskViewModel = TaskListViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
    }
    
    func testNumberOfSectionsIsTwo() {
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInSectionZeroIsTasksCount() {
        sut.taskViewModel?.add(task: Task(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.taskViewModel?.add(task: Task(title: "Bar"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
//    func testNumberOfRowsInSectionOneIsDoneTasksCount() {
//        sut.taskManager?.add(task: Task(title: "Foo"))
//        sut.taskManager?.checkTask(at: 0)
//        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
//
//        sut.taskManager?.add(task: Task(title: "Bar"))
//        sut.taskManager?.checkTask(at: 0)
//        tableView.reloadData()
//
//        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
//    }
    

}
