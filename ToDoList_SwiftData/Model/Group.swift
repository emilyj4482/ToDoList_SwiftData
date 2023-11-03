//
//  Group.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import Foundation
import SwiftData

@Model
final class Group {
    var name: String
    
    @Relationship(deleteRule: .cascade, inverse: \Task.group) var tasks: [Task]
    
    init(name: String = "", tasks: [Task] = []) {
        self.name = name
        self.tasks = tasks
    }
}
