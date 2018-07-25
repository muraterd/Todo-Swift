//
//  TodoCVCell.swift
//  Todo
//
//  Created by Murat Erdogan on 21.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import UIKit
import M13Checkbox

class TodoCVCell: UICollectionViewCell {
    
    // IBOutlets
    @IBOutlet weak var checkbox: M13Checkbox!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        checkbox.isUserInteractionEnabled = false
    }
    
    func setupUI(_ task: Task) {
        title.text = task.title
        task.completed ? setAsCompleted(animated: false) : setAsNotCompleted(animated: false)
        
        //let newState: M13Checkbox.CheckState = task.completed ? .checked : .unchecked
        //checkbox.checkState = newState
    }
    
    func setAsCompleted(animated: Bool = true) {
        checkbox.setCheckState(.checked, animated: animated)
        title.textColor = UIColor.gray
    }
    
    func setAsNotCompleted(animated: Bool = true) {
        checkbox.setCheckState(.unchecked, animated: animated)
        title.textColor = UIColor.black
    }
}
