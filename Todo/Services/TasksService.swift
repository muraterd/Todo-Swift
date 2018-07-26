//
//  TasksService.swift
//  Todo
//
//  Created by Murat Erdogan on 23.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import Foundation

protocol TasksDataSourceProtocol {
    func toggleCompleted(index: Int) -> Bool
    func getAll() -> [Task]
    func add(newTask: Task)
    func delete(index: Int)
}

class TasksService {

    let dataSource: TasksDataSourceProtocol
    
    init(dataSource: TasksDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func toggleCompleted(index: Int) -> Bool {
        return dataSource.toggleCompleted(index: index)
    }
    
    func getAll() -> [Task] {
        return dataSource.getAll()
    }
    
    func add(newTask: Task) {
        dataSource.add(newTask: newTask)
    }
    
    func delete(index: Int) {
        dataSource.delete(index: index)
    }

}
