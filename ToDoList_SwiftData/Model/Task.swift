//
//  Task.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 11/2/23.
//

import Foundation
import SwiftData

@Model
final class Task {
    var title: String
    var isDone: Bool
    var isImportant: Bool
    
    @Relationship(deleteRule: .nullify) var group: Group
    
    init(title: String, isDone: Bool, isImportant: Bool, group: Group) {
        self.title = title
        self.isDone = isDone
        self.isImportant = isImportant
        self.group = group
    }
}
