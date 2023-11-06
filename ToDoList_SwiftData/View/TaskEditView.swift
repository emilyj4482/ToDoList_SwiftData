//
//  TaskEditView.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 02/11/2023.
//

import SwiftUI
import SwiftData

struct TaskEditView: View {
    
    @Environment(\.dismiss) var dismiss
    @Bindable var group: Group
    
    @FocusState var focused: Bool
    @State var taskTitle: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .foregroundStyle(.red)
            
            TextField("Enter a task.", text: $taskTitle)
                .focused($focused)
                .onSubmit {
                    dismiss()
                }
            
            Spacer()
            
            Button {
                let task = Task(title: taskTitle.trim(), group: group)
                group.tasks.append(task)
                dismiss()
            } label: {
                Text("Done")
            }
        }
        .padding(16)
        .onAppear {
            focused = true
        }
    }
}

/*
#Preview {
    TaskEditView()
}
*/
