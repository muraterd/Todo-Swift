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
    
    func loadTestData(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func toggleCompleted(task: Task) throws -> Bool {
        if let index = tasks.index(where: {$0.id == task.id}) {
            let isCompleted = !tasks[index].completed
            tasks[index].completed = isCompleted
            
            return isCompleted
        } else {
            throw "Couldn't find a task with id: \(task.id)"
        }
    }
    
    func findById(id: String) -> Task? {
        if let task = tasks.first(where: {$0.id == id}) {
            return task
        } else {
            return nil
        }
    }
    
    func getAll() -> [Task] {
        return tasks
    }
    
    func add(newTask: Task) -> Task {
        tasks.append(newTask)
        return newTask
    }
    
    func delete(task: Task) {
        if let index = tasks.index(where: {$0.id == task.id}) {
            tasks.remove(at: index)
        }
    }
}
