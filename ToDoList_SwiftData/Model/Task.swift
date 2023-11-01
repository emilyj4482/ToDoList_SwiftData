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
    var id: UUID = UUID()
    let groupId: Int
    var title: String
    var isDone: Bool
    var isImportant: Bool
    
    init(groupId: Int, title: String, isDone: Bool, isImportant: Bool) {
        self.groupId = groupId
        self.title = title
        self.isDone = isDone
        self.isImportant = isImportant
    }
}
