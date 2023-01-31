//
//  DetailTaskDataProviderTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 31.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class DetailTaskDataProviderTests: XCTestCase {

    var sut: DetailTaskDataProvider!
    var tableView: UITableView!
    var view: DetailTaskViewController!
    
    override func setUpWithError() throws {
        sut = DetailTaskDataProvider()
        sut.viewModel = DetailTaskViewModel()
        view = DetailTaskViewController(viewModel: sut.viewModel)
        
        view.loadViewIfNeeded()
        
        tableView = view.tableView
//        tableView.dataSource = sut
//        tableView.delegate = sut
    }

    override func tearDownWithError() throws {
       
    }

  

}
