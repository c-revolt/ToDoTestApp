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
        sut.viewModel = TaskListViewModel()
        tableView = UITableView()
        tableView.dataSource = sut
        
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
        sut.viewModel?.add(task: Task(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.viewModel?.add(task: Task(title: "Bar"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberOfRowsInSectionOneIsDoneTasksCount() {
        sut.viewModel?.add(task: Task(title: "Foo"))
        sut.viewModel?.checkTask(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)

        sut.viewModel?.add(task: Task(title: "Bar"))
        sut.viewModel?.checkTask(at: 0)
        tableView.reloadData()

        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func testCellForRowAtIndexPathReturnsTaskCell() {
        sut.viewModel.add(task: Task(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is TaskCell)
    }

}
