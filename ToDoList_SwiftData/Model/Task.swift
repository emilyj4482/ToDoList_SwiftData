//
//  Task.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import Foundation
import SwiftData

@Model
final class Task {
    var title: String
    var isDone: Bool
    var isImportant: Bool
    // group.tasks array에서 task가 추가된 순이 아닌 무작위로 정렬되는 것을 개선하기 위한 프로퍼티
    let timestamp: Date
    
    // many to many relationship을 위해 task 또한 group을 array 형태로 가져야 함.
    @Relationship(deleteRule: .nullify) var groups: [Group]?
    
    init(title: String, isDone: Bool = false, isImportant: Bool = false, timestamp: Date = .now, groups: [Group]) {
        self.title = title
        self.isDone = isDone
        self.isImportant = isImportant
        self.timestamp = timestamp
        self.groups = groups
    }
}
