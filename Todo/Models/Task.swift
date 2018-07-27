//
//  Task.swift
//  Todo
//
//  Created by Murat Erdogan on 23.07.2018.
//  Copyright © 2018 Murat Erdogan. All rights reserved.
//

import Foundation

struct Task {
    let id = UUID().uuidString
    var title: String
    var completed = false
}
