//
//  TaskManagerTests.swift
//  ToDoTestAppTests
//
//  Created by Александр Прайд on 24.01.2023.
//

import XCTest
@testable import ToDoTestApp

final class TaskManagerTests: XCTestCase {

    var sut: TaskManager!
    var task: Task!
    
    override func setUpWithError() throws {
        sut = TaskManager()
        task = Task(title: "Foo")
    }

    override func tearDownWithError() throws {
        sut = nil
        task = nil
    }

    func testInitTaskManagerWithZeroTasks() {
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    func testInitTaskManagerWithZeroDoneTasks() {
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testTaskAtIndexIsAddedTask() {
        sut.add(task: task)
        let returnedTask = sut.task(at: 0)
        XCTAssertEqual(task.title, returnedTask.title)
    }
    
    func testCheckTaskAtIndexChangesCounts() {
        sut.add(task: task)
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
        XCTAssertEqual(sut.task(at: 0).title, "Bar")
    }
    
    func testDoneTaskAtReturnsCheckedTask() {
        sut.add(task: task)
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTask(at: 0)
        XCTAssertEqual(returnedTask.title, task.title)
    }
}
