//
//  Group.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 11/2/23.
//

import Foundation
import SwiftData

@Model
final class Group {
    let id: Int
    var name: String
    var tasks: [Task]
    
    init(id: Int, name: String, tasks: [Task]) {
        self.id = id
        self.name = name
        self.tasks = tasks
    }
}
