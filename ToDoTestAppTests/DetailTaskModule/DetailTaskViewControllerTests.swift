//
//  DetailTaskViewControllerTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 30.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class DetailTaskViewControllerTests: XCTestCase {
    
    var viewModel: DetailTaskViewModel!
    var sut: DetailTaskViewController!
    
    override func setUpWithError() throws {
        viewModel = DetailTaskViewModel()
        sut = DetailTaskViewController(viewModel: viewModel)
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
        XCTAssertNotNil(sut.detailTaskDataProvider)
    }
    
    func testWhenViewIsloadedTableViewDelegateSet() {
        XCTAssertTrue(sut.tableView.delegate is DetailTaskDataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceSet() {
        XCTAssertTrue(sut.tableView.dataSource is DetailTaskDataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        
        XCTAssertEqual(sut.tableView.delegate as? DetailTaskDataProvider, sut.tableView.dataSource as? DetailTaskDataProvider)
    }


}
