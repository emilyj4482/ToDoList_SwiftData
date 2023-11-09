//
//  Important.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 03/11/2023.
//

import Foundation
import SwiftData

@Model
final class Important {
    var name: String = "Important"
    var tasks: [Task]
    
    init(name: String = "Important", tasks: [Task] = []) {
        self.name = name
        self.tasks = tasks
    }
}
