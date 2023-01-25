//
//  TaskListViewControllerTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 25.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class TaskListViewControllerTests: XCTestCase {

    var viewModel: TaskListViewModel!
    var sut: TaskListViewController!
    
    override func setUpWithError() throws {
        viewModel = TaskListViewModel()
        sut = TaskListViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        sut = nil
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedDataProviderIsNotNil() {
        XCTAssertNotNil(sut.dataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView?.delegate is TaskListDataProvider)
    }

    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView?.dataSource is TaskListDataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        XCTAssertEqual(
            sut.tableView?.delegate as? TaskListDataProvider,
            sut.tableView?.dataSource as? TaskListDataProvider
        )
    }

}
