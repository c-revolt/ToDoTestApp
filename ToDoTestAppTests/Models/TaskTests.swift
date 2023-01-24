//
//  TaskTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 24.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertEqual(task.description, "Bar")
    }
    
    func testInitWithDate() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task.date)
    }
    
    func testWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")
        let task = Task(title: "Bar",
                        location: location)
        XCTAssertEqual(location, task.location)
        
    }
    

    

}
