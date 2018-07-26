//
//  ViewController.swift
//  Todo
//
//  Created by Murat Erdogan on 19.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import UIKit
import  M13Checkbox
import SwipeCellKit

let tasksService = TasksService(dataSource: MockTasksDataSource())

class ListViewController: UIViewController {

    // Variables
    var tasks: [Task] = tasksService.getAll()
    
    // IBOutlets
    @IBOutlet weak var addTaskBtn: UIButton!
    @IBOutlet weak var tasksCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Collection view
        tasksCV.delegate = self
        tasksCV.dataSource = self
        
        addTaskBtn.layer.cornerRadius = addTaskBtn.frame.width / 2
    }
}

extension ListViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Returns collection view cell count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // Binds cell with data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoCell", for: indexPath) as! TodoCVCell
        
        cell.delegate = self
        cell.setupUI(tasks[indexPath.row])
        
        return cell
    }
    
    // Select a cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let isChecked = tasksService.toggleCompleted(index: indexPath.row)
        tasks = tasksService.getAll()
        
        if let cell = collectionView.cellForItem(at: indexPath) as? TodoCVCell {
            isChecked ? cell.setAsCompleted() : cell.setAsNotCompleted()
        }
    }
}

extension ListViewController : SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            tasksService.delete(index: indexPath.row)
            self.tasks = tasksService.getAll()
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}

extension ListViewController : AddTaskDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target = segue.destination as! AddViewController
        target.delegate = self
    }
    
    func onTaskAdded() {
        tasks = tasksService.getAll()
        tasksCV.reloadData()
    }
}
