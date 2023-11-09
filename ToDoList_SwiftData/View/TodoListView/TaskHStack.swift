//
//  TaskHStack.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI
import SwiftData

struct TaskHStack: View {
    
    @Query private var groups: [Group]
    @Bindable var task : Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(task.isDone ? .green : .red)
                .onTapGesture {
                    task.isDone.toggle()
                }
            
            Text(task.title)
            
            Spacer()
            
            Image(systemName: task.isImportant ? "star.fill": "star")
                .foregroundStyle(.yellow)
                .onTapGesture {
                    task.isImportant.toggle()
                    // important 여부에 따라 Important group에 추가 또는 삭제
                    // TODO: Important에 추가 시 기존 group에서 task가 사라지는 것 해결
                    if task.isImportant {
                        groups[0].tasks.append(task)
                    } else {
                        groups[0].tasks.removeAll { $0.id == task.id }
                    }
                }
        }
    }
}
