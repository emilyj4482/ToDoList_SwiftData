//
//  TaskHStack.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI

struct TaskHStack: View {
    
    @State var task : Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(task.isDone ? .green : .red)
            
            Text(task.title)
            
            Spacer()
            
            Image(systemName: task.isImportant ? "star.fill": "star")
                .foregroundStyle(.yellow)
        }
    }
}
