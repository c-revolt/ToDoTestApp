//
//  TaskListViewModelTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 25.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class TaskListViewModelTests: XCTestCase {
    
    var sut: TaskListViewModelProtocol!

    override func setUpWithError() throws {
        sut = TaskListViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testInitViewModelWithZeroTasks() {
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    func testInitViewModelWithZeroDoneTasks() {
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        let returnedTask = sut.task(at: 0)
        XCTAssertEqual(task.title, returnedTask.title)
    }
    
    func testCheckTaskAtIndexChangesCounts() {
        sut.add(task: Task(title: "Foo"))
        sut.checkTask(at: 0)
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
    }
    
    func testCheckedTaskRemovedFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        sut.checkTask(at: 0)
        XCTAssertEqual(sut.task(at: 0), secondTask)
    }
    
    func testDoneTaskAtReturnsCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTask(at: 0)
        XCTAssertEqual(returnedTask, task)
    }
    
    func testRemoveAllResultsCountsBeZero() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Bar"))
        sut.checkTask(at: 0)
        sut.removeAll()
        
        XCTAssertTrue(sut.tasksCount == 0)
        XCTAssertTrue(sut.doneTasksCount == 0)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Foo"))
        XCTAssertTrue(sut.tasksCount == 1)
    }
}
