//
//  MockTasksDataSourceTests.swift
//  TodoTests
//
//  Created by Murat Erdogan on 27.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import XCTest
@testable import Todo

class MockTasksDataSourceTests: XCTestCase {
    
    var datasource: MockTasksDataSource!
    var testData: [Task]!
    
    override func setUp() {
        super.setUp()
        
        testData = prepareTestData()
        datasource = MockTasksDataSource()
        datasource.loadTestData(tasks: testData)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func prepareTestData() -> [Task]{
        var tasks: [Task] = []
        
        tasks.append(Task(title: "Task 1", completed: false))
        tasks.append(Task(title: "Task 2", completed: false))
        
        return tasks
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd_AddsTask() {
        let newTask = Task(title: "Test 1", completed: false)
        _ = datasource.add(newTask: newTask)
        
        XCTAssertEqual(datasource.tasks.count, 3)
    }
    
    func testFindById_ReturnsTask() {
        let addedTask = datasource.add(newTask: Task(title: "Test 1", completed: false))
        
        let foundTask = datasource.findById(id: addedTask.id)
        
        XCTAssertEqual(foundTask?.id, addedTask.id)
    }
    
    func testFindById_ReturnsNil_IfTaskNotFound() {
        _ = datasource.add(newTask: Task(title: "Test 1", completed: false))
        
        let foundTask = datasource.findById(id: UUID().uuidString)
        
        XCTAssertNil(foundTask)
    }
    
    func testDelete_DeletesTask() {
        let testTask = testData.first!

        datasource.delete(task: testTask)
        
        XCTAssertEqual(datasource.tasks.count, 1)
    }
    
}
