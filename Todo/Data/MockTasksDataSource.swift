//
//  MockTasksDataSource.swift
//  Todo
//
//  Created by Murat Erdogan on 25.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import Foundation

class MockTasksDataSource : TasksDataSourceProtocol {
    
    var tasks = [Task]()
    
    init() {
        tasks.append(Task(title: "Remember the milk", completed: true))
        tasks.append(Task(title: "Buy some beers", completed: false))
    }
    
    func toggleCompleted(index: Int) -> Bool {
        let isChecked = !tasks[index].completed
        tasks[index].completed = isChecked
        return isChecked
    }
    
    func getAll() -> [Task] {
        return tasks
    }
    
    func add(newTask: Task) {
        tasks.append(newTask)
    }
}
