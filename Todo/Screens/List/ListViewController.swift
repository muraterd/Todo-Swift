//
//  ViewController.swift
//  Todo
//
//  Created by Murat Erdogan on 19.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import UIKit
import  M13Checkbox

let tasksService = TasksService(dataSource: MockTasksDataSource())

class ListViewController: UIViewController {

    // Variables
    var tasks: [Task] = tasksService.getAll()
    
    // IBOutlets
    @IBOutlet weak var tasksCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Collection view
        tasksCV.delegate = self
        tasksCV.dataSource = self
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
