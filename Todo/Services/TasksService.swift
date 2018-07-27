//
//  TasksService.swift
//  Todo
//
//  Created by Murat Erdogan on 23.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import Foundation

protocol TasksDataSourceProtocol {
    func toggleCompleted(task: Task) throws -> Bool
    func findById(id: String) -> Task?
    func getAll() -> [Task]
    func add(newTask: Task) -> Task
    func delete(task: Task)
}

class TasksService {

    let dataSource: TasksDataSourceProtocol
    
    init(dataSource: TasksDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func toggleCompleted(task: Task) throws -> Bool {
        return try dataSource.toggleCompleted(task: task)
    }
    
    func getAll() -> [Task] {
        return dataSource.getAll()
    }
    
    func add(newTask: Task) -> Task {
        return dataSource.add(newTask: newTask)
    }
    
    func delete(task: Task) {
        dataSource.delete(task: task)
    }

}
