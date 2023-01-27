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
    var controller: TaskListViewController!
    
    override func setUpWithError() throws {
        sut = TaskListDataProvider()
        sut.viewModel = TaskListViewModel()
        controller = TaskListViewController(viewModel: sut.viewModel)
        
        controller.loadViewIfNeeded()
        
        tableView = controller.tableView
        tableView.dataSource = sut
        tableView.delegate = sut
        
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
    
    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSouce: sut)
        
        sut.viewModel.add(task: Task(title: "Foo"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellsDequeued)
    }
    
    func testCellForRowInSectionZeroCallsConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSouce: sut)
        mockTableView.dataSource = sut
        mockTableView.register(MockTaskCell.self, forCellReuseIdentifier: TaskCell.reusedID)
        
        let task = Task(title: "Foo")
        sut.viewModel.add(task: task)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTaskCell
        
        XCTAssertEqual(cell.task, task)
    }
    
    func testCellForRowInSectionOneCallsConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSouce: sut)
        mockTableView.dataSource = sut
        mockTableView.register(MockTaskCell.self, forCellReuseIdentifier: TaskCell.reusedID)
        
        let task = Task(title: "Foo")
        let task2 = Task(title: "Bar")
        sut.viewModel.add(task: task)
        sut.viewModel.add(task: task2)
        sut.viewModel.checkTask(at: 0)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockTaskCell
        
        XCTAssertEqual(cell.task, task)
    }
    
    func testDeleteButtonTitleSectionZeroShowsDone() {
        let titleButton = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(titleButton, "Done")
    }
    
    func testDeleteButtonTitleSectionOneShowsDone() {
        let titleButton = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(titleButton, "Undone")
    }
    
    func testCheckingTaskChecksInTaskManager() {
        let task = Task(title: "Foo")
        sut.viewModel.add(task: task)
        
        tableView.dataSource?.tableView?(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.viewModel.tasksCount, 0)
        XCTAssertEqual(sut.viewModel.doneTasksCount, 1)
    }
    
    func testUncheckingTaskUnchecksInTaskListViewModel() {
        let task = Task(title: "Foo")
        sut.viewModel.add(task: task)
        sut.viewModel.checkTask(at: 0)
        tableView.reloadData()
        
        tableView.dataSource?.tableView?(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(sut.viewModel.tasksCount, 1)
        XCTAssertEqual(sut.viewModel.doneTasksCount, 0)
    }
}

extension TaskListDataProviderTests {
    class MockTableView: UITableView {
        
        static func mockTableView(withDataSouce dataSource: UITableViewDataSource) -> MockTableView {
            
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 300, height: 600), style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockTaskCell.self, forCellReuseIdentifier: TaskCell.reusedID)
            
            return mockTableView
        }
        var cellsDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockTaskCell: TaskCell {
        var task: Task?
        
        override func configure(withTask task: Task) {
            self.task = task
        }
    }
}
