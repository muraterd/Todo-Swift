//
//  AddViewController.swift
//  Todo
//
//  Created by Murat Erdogan on 21.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import UIKit

protocol AddTaskDelegate {
    func onTaskAdded()
}

class AddViewController: UIViewController {

    // Variables
    var delegate: AddTaskDelegate!
    
    // IBOutlets
    @IBOutlet weak var newTask: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onCloseButtonPressed(_ sender: Any) {
        closeModal()
    }
    
    @IBAction func onOverlayButtonPressed(_ sender: Any) {
        closeModal()
    }
    
    @IBAction func onAddTaskButtonPressed(_ sender: Any) {
        if !newTask.text.isEmpty {
            tasksService.add(newTask: Task(title: newTask.text, completed: false))
            delegate.onTaskAdded()
        }
        closeModal()
    }
    
    private func closeModal() {
        dismiss(animated: true, completion: nil)
    }

}
