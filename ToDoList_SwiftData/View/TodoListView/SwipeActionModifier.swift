//
//  SwipeActionModifier.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 19/11/2023.
//

import SwiftUI
import SwiftData

struct SwipeActionModifier: ViewModifier {

    @Query private var groups: [Group]
    
    @State var task: Task
    @Binding var taskToEdit: Task?
    @Binding var showEdit: Bool
    
    func body(content: Content) -> some View {
        content
            .swipeActions(allowsFullSwipe: false) {
                // delete button
                Button {
                    // important task인 경우 important group 및 원래 소속 group 모두에서 task를 삭제
                    groups.forEach { group in
                        group.tasks.removeAll { $0.id == task.id }
                    }
                } label: {
                    Image(systemName: "trash")
                }
                .tint(.red)
                
                // edit button
                Button {
                    taskToEdit = task
                    showEdit.toggle()
                } label: {
                    Image(systemName: "pencil")
                }
                .tint(.cyan)
            }
    }
}


extension View {
    func swipeActionModifier(group: Group, task:  Task, taskToEdit: Binding<Task?>, showEdit: Binding<Bool>) -> some View {
        modifier(SwipeActionModifier(task: task, taskToEdit: taskToEdit, showEdit: showEdit))
    }
}
