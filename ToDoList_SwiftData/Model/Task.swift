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
    @Relationship(deleteRule: .nullify) var group: Group?
    
    // group.tasks array에서 task가 추가된 순이 아닌 무작위로 정렬되는 것을 개선하기 위한 프로퍼티
    let timestamp: Date
    
    init(title: String, isDone: Bool = false, isImportant: Bool = false, group: Group, timestamp: Date = .now) {
        self.title = title
        self.isDone = isDone
        self.isImportant = isImportant
        self.group = group
        self.timestamp = timestamp
    }
}
