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
}
