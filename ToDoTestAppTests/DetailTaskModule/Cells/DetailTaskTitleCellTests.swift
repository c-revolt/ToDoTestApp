//
//  DetailTaskTitleCellTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 30.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class DetailTaskTitleCellTests: XCTestCase {

    var sut: DetailTaskTitleCell!
    
    override func setUpWithError() throws {
        sut = DetailTaskTitleCell()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSutHasTitleLabel() {
        XCTAssertTrue(sut.titleLabel.isDescendant(of: sut.titleLabel))
    }
    
    func testSutHasTitleTextField() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.titleTextField))
    }
    
    

    

}
